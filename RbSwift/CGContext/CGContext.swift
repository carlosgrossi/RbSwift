//
//  CGContext.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import CoreGraphics

public extension CGContext {
	
	public static func contextWith(cgImage: CGImage, size: CGSize, interpolationQuality: CGInterpolationQuality = .high) -> CGContext? {
		let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
		let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
		
		let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
		context?.interpolationQuality = interpolationQuality
		context?.draw(cgImage, in: CGRect(origin: CGPoint.zero, size: CGSize(width: CGFloat(size.width), height: CGFloat(size.height))))
		return context
	}
	
}
