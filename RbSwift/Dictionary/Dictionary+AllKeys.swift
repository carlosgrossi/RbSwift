//
//  Dictionary+AllKeys.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public extension Dictionary where Value: Equatable {
	public func allKeys(forValue val: Value) -> [Key] {
		return self.filter { $1 == val }.map { $0.0 }
	}
}
