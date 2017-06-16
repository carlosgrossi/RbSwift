//
//  JSONSerialization+Serialize.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension JSONSerialization {
	
	static func serialize<T>(data: Data, readingOptions: JSONSerialization.ReadingOptions = .allowFragments) -> T? {
		do {
			return try JSONSerialization.jsonObject(with: data, options: readingOptions) as? T
		} catch {
			return nil
		}
		
	}
}
