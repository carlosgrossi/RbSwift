//
//  Dictionary+Union.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

extension Dictionary {
	
	mutating func union(_ dictionary: Dictionary) {
		dictionary.forEach { self.updateValue($1, forKey: $0) }
	}
	
	func union(_ dictionary: Dictionary) -> Dictionary {
		let dictionary = dictionary
		return dictionary.union(self)
	}
	
}
