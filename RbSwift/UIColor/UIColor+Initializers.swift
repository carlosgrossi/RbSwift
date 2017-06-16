//
//  UIColor+Initializers.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import UIKit

extension UIColor {
	
	convenience init(hex: String, alpha: CGFloat = 1.0) {
		let hex = UInt(hex: hex) ?? 0
		self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
		          green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
		          blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: alpha)
	}
	
	convenience init(iRed: CGFloat, iGreen: CGFloat, iBlue: CGFloat, alpha: CGFloat) {
		self.init(red: iRed / 255.0, green: iGreen / 255.0, blue: iBlue / 255.0, alpha: 1.0)
	}
	
}
