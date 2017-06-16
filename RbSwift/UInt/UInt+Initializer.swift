//
//  UInt+Initializer.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension UInt {
	
	init?(exactly: UInt?) {
		guard let exactly = exactly else { return nil }
		self.init(exactly: exactly)
	}
	
	init?(hex: String) {
		self.init(exactly: UInt(hex, radix: 16))
	}
	
}
