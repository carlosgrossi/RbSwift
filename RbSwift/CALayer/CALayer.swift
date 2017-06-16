//
//  CALayer.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import QuartzCore

extension CALayer {
	public func addFadeAnimation() {
		let animation = CATransition()
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		animation.type = kCATransitionFade
		animation.duration = 0.5
		self.add(animation, forKey: "kCATransitionFade")
	}
}
