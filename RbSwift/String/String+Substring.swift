//
//  String+Substring.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension String {
	
	func rangesOf(substring: String) -> [NSRange] {
		let inputLength = self.characters.count
		var rangesFound: [NSRange] = []
		var range = NSRange(location: 0, length: inputLength)
		
		while range.location != NSNotFound {
			range = (self as NSString).range(of: substring, options: [], range: range)
			if range.location != NSNotFound {
				rangesFound.append(range)
				range = NSRange(location: range.location + 1, length: inputLength - range.location - 1)
			} else {
				return rangesFound
			}
		}
		
		return []
	}
}
