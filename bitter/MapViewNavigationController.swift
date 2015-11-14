//
//  MapViewController.swift
//  bitter
//
//  Created by Matt Condon on 11/13/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit

class MapViewNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    pushViewController(MapViewController(), animated: false)
  }

}
