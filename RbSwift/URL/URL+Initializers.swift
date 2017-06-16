//
//  URL+Initializers.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

extension URL {
	
	init?(string: String, args: [CVarArg]) {
		guard let string = String(format: string, arguments: args).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return nil }
		self.init(string:string)
	}
	
	init?(string: String?) {
		guard let string = string else { return nil }
		self.init(string:string)
	}
	
}
