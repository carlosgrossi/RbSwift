//
//  UIImageView.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

public extension UIImageView {
	
	/**
	Change the image from a UIImageView with a Cross Fade effect
	
	- Parameter toImage: The final image on the cross fade animation
	- Parameter duration: The duration in seconds of the animation
	*/
	func crossFade(_ toImage: UIImage?, duration: CFTimeInterval) {
		let crossFade = CABasicAnimation(keyPath: "contents")
		crossFade.duration = duration
		crossFade.fromValue = self.image?.cgImage
		crossFade.toValue = toImage?.cgImage
		self.layer.add(crossFade, forKey: "animateContents")
		self.image = toImage
	}
	
	
	/**
	Mask the current image from a UIImageView with a mask image
	
	- Parameter maskImage: Image that will be used as a mask
	*/
	func maskImage(_ maskImage: UIImage) {
		guard let image = self.image else { return }
		guard let maskRef = maskImage.cgImage else { return }
		guard let dataProvider = maskRef.dataProvider else { return }
		guard let mask = CGImage(maskWidth: maskRef.width,
		                         height: maskRef.height,
		                         bitsPerComponent: maskRef.bitsPerComponent,
		                         bitsPerPixel: maskRef.bitsPerPixel,
		                         bytesPerRow: maskRef.bytesPerRow,
		                         provider: dataProvider,
		                         decode: nil,
		                         shouldInterpolate: false)
			else { return }
		
		guard let maskedImageRef = image.cgImage?.masking(mask) else { return }
		let maskedImage = UIImage(cgImage: maskedImageRef)
		self.image = maskedImage
	}
	
	/**
	Load image from a remote server and sets it as UIImageView image
	
	- Parameter imageURL: URL for an image on a remote server
	- Parameter crossfadin: Set image with crossfade animation
	*/
	func setImage(from imageURL: URL?, crossfading: Bool = true, duration: TimeInterval = 1, completitionHandler:(() -> Void)? = nil) {
		guard let imageURL = imageURL else { completitionHandler?(); return }
		if let cachedImage = imageCache.object(forKey: imageURL.absoluteString as AnyObject) as? UIImage {
			if crossfading {
				self.crossFade(cachedImage, duration: duration)
				completitionHandler?()
			} else {
				self.image = cachedImage
				completitionHandler?()
			}
			return
		}
		
		URLSession.dataTask(with: imageURL) { (data, _, error) in
			guard error == nil else { completitionHandler?(); return }
			guard let imageData = data else { completitionHandler?(); return }
			
			let image = UIImage(data: imageData)
			DispatchQueue.main.async(execute: {
				
				if crossfading {
					self.crossFade(image, duration: duration)
					completitionHandler?()
				} else {
					self.image = image
					completitionHandler?()
				}
				
			})
			
			if let unwrappedImage = image {
				imageCache.setObject(unwrappedImage, forKey: imageURL.absoluteString as AnyObject)
			}
		}
	}
	
	func setImage(from imageData: Data?, imageCacheKey: String, crossfading: Bool = true, duration: TimeInterval = 1, completitionHandler:(() -> Void)? = nil) {
		guard let imageData = imageData else { completitionHandler?(); return }
		
		if let cachedImage = imageCache.object(forKey: imageCacheKey as AnyObject) as? UIImage {
			if crossfading {
				self.crossFade(cachedImage, duration: duration)
				completitionHandler?()
			} else {
				self.image = cachedImage
				completitionHandler?()
			}
			return
		}
		
		let image = UIImage(data: imageData)
		DispatchQueue.main.async(execute: {
			
			if crossfading {
				self.crossFade(image, duration: duration)
				completitionHandler?()
			} else {
				self.image = image
				completitionHandler?()
			}
			
		})
		
		if let unwrappedImage = image {
			imageCache.setObject(unwrappedImage, forKey: imageCacheKey as AnyObject)
		}
		
	}
	
}
