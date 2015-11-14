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
    return sc
  }()

  let mapView = BITRMapView()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.titleView = segmentedControl

    view.addSubview(mapView)
    mapView.snp_makeConstraints { make in
      make.edges.equalTo(view)
    }
  }

}
