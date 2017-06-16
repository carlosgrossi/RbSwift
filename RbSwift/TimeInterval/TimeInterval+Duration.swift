//
//  TimeInterval+String.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

extension TimeInterval {
	
	public var duration: String {
		get {
			let seconds = Int(self) % 60
			let minutes = (Int(self) / 60) % 60
			let hours = (Int(self) / 3600)
			return String(format: "%02d%@ %02d%@ %02d%@", hours, "h", minutes, "m", seconds, "s")
		}
	}
	
}
