//
//  GTBigButton.swift
//  geotap
//
//  Created by Matt Condon on 7/11/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit

class MKButton: UIButton {

  var maskEnabled: Bool = true {
    didSet {
      mkLayer.enableMask(maskEnabled)
    }
  }
  var rippleLocation: MKRippleLocation = .TapLocation {
    didSet {
      mkLayer.rippleLocation = rippleLocation
    }
  }
  var ripplePercent: Float = 0.9 {
    didSet {
      mkLayer.ripplePercent = ripplePercent
    }
  }
  var backgroundLayerCornerRadius: CGFloat = 0.0 {
    didSet {
      mkLayer.setBackgroundLayerCornerRadius(backgroundLayerCornerRadius)
    }
  }
  // animations
  var shadowAniEnabled: Bool = true
  var backgroundAniEnabled: Bool = true {
    didSet {
      if !backgroundAniEnabled {
        mkLayer.enableOnlyCircleLayer()
      }
    }
  }
  var rippleAniDuration: Float = 0.75
  var backgroundAniDuration: Float = 1.0
  var shadowAniDuration: Float = 0.65

  var rippleAniTimingFunction: MKTimingFunction = .Linear
  var backgroundAniTimingFunction: MKTimingFunction = .Linear
  var shadowAniTimingFunction: MKTimingFunction = .EaseOut

  var cornerRadius: CGFloat = 2.5 {
    didSet {
      layer.cornerRadius = cornerRadius
      mkLayer.setMaskLayerCornerRadius(cornerRadius)
    }
  }
  // color
  var rippleLayerColor: UIColor = UIColor(white: 0.45, alpha: 0.5) {
    didSet {
      mkLayer.setCircleLayerColor(rippleLayerColor)
    }
  }
  var backgroundLayerColor: UIColor = UIColor(white: 0.75, alpha: 0.25) {
    didSet {
      mkLayer.setBackgroundLayerColor(backgroundLayerColor)
    }
  }
  override var bounds: CGRect {
    didSet {
      mkLayer.superLayerDidResize()
    }
  }

  private lazy var mkLayer: MKLayer = MKLayer(superLayer: self.layer)

  // MARK - initilization
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayer()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupLayer()
  }

  // MARK - setup methods
  private func setupLayer() {
    adjustsImageWhenHighlighted = false
    cornerRadius = 2.5
    mkLayer.setBackgroundLayerColor(backgroundLayerColor)
    mkLayer.setCircleLayerColor(rippleLayerColor)
  }

  // MARK - location tracking methods
  override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {

    if rippleLocation == .TapLocation {
      mkLayer.didChangeTapLocation(touch.locationInView(self))
    }

    // rippleLayer animation
    mkLayer.animateScaleForCircleLayer(0.45, toScale: 1.0, timingFunction: rippleAniTimingFunction, duration: CFTimeInterval(self.rippleAniDuration))

    // backgroundLayer animation
    if backgroundAniEnabled {
      mkLayer.animateAlphaForBackgroundLayer(backgroundAniTimingFunction, duration: CFTimeInterval(self.backgroundAniDuration))
    }

    // shadow animation for self
    if shadowAniEnabled {
      let shadowRadius = layer.shadowRadius
      let shadowOpacity = layer.shadowOpacity
      let duration = CFTimeInterval(shadowAniDuration)
      mkLayer.animateSuperLayerShadow(10, toRadius: shadowRadius, fromOpacity: 0, toOpacity: shadowOpacity, timingFunction: shadowAniTimingFunction, duration: duration)
    }

    return super.beginTrackingWithTouch(touch, withEvent: event)
  }
  
}
