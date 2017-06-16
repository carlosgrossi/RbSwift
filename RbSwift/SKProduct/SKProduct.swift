//
//  SKProduct.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import StoreKit

extension SKProduct {
	
	public func localizedPrice() -> String? {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.locale = self.priceLocale
		return formatter.string(from: self.price)
	}
	
}
