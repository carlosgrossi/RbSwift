//
//  NumberFormatter+Initializers.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

extension NumberFormatter {
	
	convenience init(numberStyle: NumberFormatter.Style, maximumFractionDigits: Int, minimumFractionDigits: Int) {
		self.init()
		self.numberStyle = numberStyle
		self.maximumFractionDigits = maximumFractionDigits
		self.minimumFractionDigits = minimumFractionDigits
		self.locale = Locale.current
	}
	
}
