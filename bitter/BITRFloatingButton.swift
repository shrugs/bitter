//
//  BITRFloatingButton.swift
//  bitter
//
//  Created by Matt Condon on 11/14/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit

let buttonSize : CGFloat = 80.0

class BITRFloatingButton: MKButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    maskEnabled = false
    ripplePercent = 1.75
    rippleLocation = .Center

    layer.shadowOpacity = 0.4
    layer.shadowRadius = 2.0
    layer.shadowColor = UIColor.blackColor().CGColor
    layer.shadowOffset = CGSize(width: 1.0, height: 5.5)
  }

  convenience init(image: String) {
    self.init(frame: CGRectNull)
    backgroundColor = .themeColor()
    rippleLayerColor = UIColor.darkThemeColor()
    cornerRadius = buttonSize / CGFloat(2.0)
    backgroundLayerCornerRadius = buttonSize / CGFloat(2.0)

    let u = UIImageView(image: UIImage(named: image)?.imageWithRenderingMode(.AlwaysTemplate))
    u.tintColor = .highlightColor()
    addSubview(u)
    u.snp_makeConstraints { (make) -> Void in
      make.center.equalTo(self)
      make.width.height.equalTo(self.snp_width).multipliedBy(0.6)
    }
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
