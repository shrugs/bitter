//
//  TranslucentStatusBarView.swift
//  bitter
//
//  Created by Matt Condon on 11/13/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit

class StatusBarView : UIView {
  let statusBarHeight = 20

  func addConstraintsTo(view: UIView) {
    self.snp_makeConstraints { make in
      make.top.left.right.equalTo(view)
      make.height.equalTo(statusBarHeight)
    }
  }
}

class TranslucentStatusBarView: StatusBarView {

  init() {
    super.init(frame: CGRectNull)
    backgroundColor = UIColor.themeColor().colorWithAlphaComponent(0.7)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}

class SolidStatusBarView: StatusBarView {

  init() {
    super.init(frame: CGRectNull)
    backgroundColor = UIColor.themeColor()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
