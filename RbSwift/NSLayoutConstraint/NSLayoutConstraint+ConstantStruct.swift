//
//  NSLayoutConstraint+ConstantStruct.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
	
	struct Constants {
		var values: [NSLayoutAttribute: CGFloat]
		
		public init(values: [NSLayoutAttribute: CGFloat]) {
			self.values = values
		}
		
		public subscript(attribute: NSLayoutAttribute) -> CGFloat {
			guard let value = values[attribute] else {
				return 0
			}
			return value
		}
	}
	
}
