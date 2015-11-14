//
//  MapViewController.swift
//  bitter
//
//  Created by Matt Condon on 11/14/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

  let segmentedControl : UISegmentedControl = {
    let sc = UISegmentedControl(items: ["All", "Friends", "Mine"])
    sc.selectedSegmentIndex = 0
    return sc
  }()

  let mapView = BITRMapView()
  let upvoteButton = BITRFloatingButton(image: "ic_add")

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.titleView = segmentedControl
    segmentedControl.addTarget(self, action: "segmentControlDidUpdate:", forControlEvents: UIControlEvents.ValueChanged)

    view.addSubview(mapView)
    mapView.snp_makeConstraints { make in
      make.edges.equalTo(view)
    }

    upvoteButton.addTarget(self, action: "upvoteButtonWasTapped:", forControlEvents: .TouchUpInside)
    view.addSubview(upvoteButton)
    upvoteButton.snp_makeConstraints { make in
      make.bottom.equalTo(view).offset(-30)
      make.right.equalTo(view).offset(-30)
      make.width.height.equalTo(buttonSize)
    }

  }

  func segmentControlDidUpdate(sender: UISegmentedControl) {
    print("Segment Control now \(sender.selectedSegmentIndex)")
  }

  func upvoteButtonWasTapped(sender: UIButton) {
    Camera.present { image in
      guard image == nil else {
        print("IMAGE IS NIL, USER CANCELLED")
        return
      }

      print("GOT IMAGE: \(image)")
    }
  }

}






























