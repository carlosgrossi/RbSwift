//
//  Array+Duplicates.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

extension Array where Element:Equatable {
	
	mutating func removeDuplicates() -> [Element] {
		var result = [Element]()
		for value in self {
			if result.contains(value) == false {
				result.append(value)
			}
		}
		self = result
		return self
	}
	
}
