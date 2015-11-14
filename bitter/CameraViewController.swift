//
//  CameraViewController.swift
//  bitter
//
//  Created by Matt Condon on 11/14/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit

protocol CameraViewControllerDelegate {
  func cameraViewControllerDidFinishWithResult(img: UIImage?)
}

class CameraViewController: UIViewController {

  var delegate : CameraViewControllerDelegate?

  let fastttCamera : FastttCamera = {
    let fc = FastttCamera()
    return fc
  }()

  let takePictureButton = BITRFloatingButton(image: "ic_photo_camera")

  override func viewDidLoad() {
    super.viewDidLoad()
    fastttCamera.delegate = self
    fastttAddChildViewController(fastttCamera)
    fastttCamera.view.frame = view.frame

    takePictureButton.addTarget(fastttCamera, action: "takePicture", forControlEvents: .TouchUpInside)
    view.addSubview(takePictureButton)
    takePictureButton.snp_makeConstraints { make in
      make.centerX.equalTo(view)
      make.bottom.equalTo(view).offset(-30)
      make.width.height.equalTo(80)
    }

    setUpStatusBar()
  }

  func setUpStatusBar() {
    let v = TranslucentStatusBarView()
    view.addSubview(v)
    v.addConstraintsTo(view)
  }
}

extension CameraViewController : FastttCameraDelegate {

  func cameraController(cameraController: FastttCameraInterface!, didFinishCapturingImage capturedImage: FastttCapturedImage!) {
    // display this image on the screen
    let v = UIImageView(image: capturedImage.rotatedPreviewImage)
    view.addSubview(v)
    v.snp_makeConstraints { make in
      make.edges.equalTo(view)
    }
  }

  func cameraController(cameraController: FastttCameraInterface!,
    didFinishNormalizingCapturedImage capturedImage: FastttCapturedImage!) {
      delegate?.cameraViewControllerDidFinishWithResult(capturedImage.fullImage)
  }
}