//
//  BITRMapView.swift
//  bitter
//
//  Created by Matt Condon on 11/13/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit

class BITRMapView: MGLMapView {
  init() {
    super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1), styleURL: NSURL(string: "mapbox://styles/mapbox/emerald-v8"))
    self.attributionButton.alpha = 0
    self.logoView.alpha = 0
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
