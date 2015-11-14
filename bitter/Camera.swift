//
//  Camera.swift
//  bitter
//
//  Created by Matt Condon on 11/14/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit

typealias CameraCallBack = (UIImage? -> Void)

class Camera: NSObject {

  var parentViewController : UIViewController!
  var callback : CameraCallBack?
  var cameraVC : CameraViewController!

  class func present(cb : CameraCallBack) {

    let c = Camera()
    c.cameraVC = CameraViewController()
    c.cameraVC.delegate = c
    c.parentViewController = UIApplication.sharedApplication().keyWindow?.rootViewController
    c.parentViewController.addChildViewController(c.cameraVC)
    c.parentViewController.view.addSubview(c.cameraVC.view)
    c.cameraVC.view.snp_makeConstraints { make in
      make.edges.equalTo(c.parentViewController.view)
    }

  }
}

extension Camera : CameraViewControllerDelegate {
  func cameraViewControllerDidFinishWithResult(img: UIImage?) {
    cameraVC.view.removeFromSuperview()
    cameraVC.removeFromParentViewController()
    self.callback?(img)
  }
}