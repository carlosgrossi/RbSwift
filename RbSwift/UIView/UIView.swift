//
//  UIView.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import UIKit

public extension UIView {
	
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
	
	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}
	
	@IBInspectable var borderColor: UIColor? {
		get {
			return UIColor(cgColor: (layer.borderColor ?? UIColor.clear.cgColor))
		}
		set {
			layer.borderColor = newValue?.cgColor
		}
	}
	
	func addSubview(view: UIView?) {
		guard let view = view else { return }
		self.addSubview(view)
	}
	
	func applyStandardConstraints(onSubview subview: UIView?, attributes: [NSLayoutAttribute] = [.top, .bottom, .left, .right]) -> [NSLayoutConstraint] {
		var constraints: [NSLayoutConstraint] = []
		for attribute in attributes {
			if let constraint = applyContraint(onView: subview, attribute: attribute, relatetBy: .equal, toItem: self) {
				constraints.append(constraint)
			}
		}
		return constraints
	}
	
	func applyContraint(onView subview: UIView?,
	                    attribute: NSLayoutAttribute,
	                    relatetBy: NSLayoutRelation = .equal,
	                    toItem: UIView? = nil,
	                    toAttribute: NSLayoutAttribute? = nil,
	                    multiplier: CGFloat = 1.0,
	                    constant: CGFloat = 0.0,
	                    priority: Float = 1000.0) -> NSLayoutConstraint? {
		
		guard let subview = subview else { return nil }
		subview.translatesAutoresizingMaskIntoConstraints = false
		
		let selfAttribute = toAttribute ?? attribute
		let constraint = NSLayoutConstraint(item: subview, attribute: attribute, relatedBy: relatetBy, toItem: toItem, attribute: selfAttribute, multiplier: multiplier, constant: constant)
		constraint.priority = priority
		constraint.isActive = true
		self.addConstraint(constraint)
		
		return constraint
	}
	
	func roundCorners(_ roundedCorners: UIRectCorner, offset: CGRect, cornerRadius: Int) {
		var frame = self.frame
		frame.origin.x += offset.origin.x
		frame.origin.y += offset.origin.y
		frame.size.width += offset.size.width
		frame.size.height += offset.size.height
		
		let cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
		let maskLayer = CAShapeLayer()
		
		maskLayer.backgroundColor = UIColor.black.cgColor
		maskLayer.path = UIBezierPath(roundedRect: frame, byRoundingCorners: roundedCorners, cornerRadii: cornerRadii).cgPath
		layer.mask = maskLayer
	}
	
	func shake(duration: CFTimeInterval, repeatCount: Float, autoreverses: Bool, xOffset: CGFloat, yOffset: CGFloat, completion:(() -> Void)? = nil) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		
		let animation = CABasicAnimation(keyPath: "position")
		animation.duration = duration
		animation.repeatCount = repeatCount
		animation.autoreverses = autoreverses
		animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - xOffset, y: self.center.y - yOffset))
		animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + xOffset, y: self.center.y + yOffset))
		
		self.layer.add(animation, forKey: "position")
		CATransaction.commit()
	}
	
	func fade(to alpha: CGFloat, duration: TimeInterval = 0.5, removingFromSuperview: Bool = false, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration, animations: {
			self.alpha = alpha
		}) { (complete) in
			self.alpha = alpha
			if removingFromSuperview { self.removeFromSuperview() }
			completion?(complete)
		}
	}
	
	public func roundedCorners(cornerRadius: CGFloat, borderWidth: CGFloat = 0.0, borderColor: UIColor = .black) {
		self.cornerRadius = cornerRadius
		self.borderWidth = borderWidth
		self.borderColor = borderColor
	}
	
	public func addTapToKeyboadDismiss() {
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		tapGestureRecognizer.cancelsTouchesInView = false
		self.addGestureRecognizer(tapGestureRecognizer)
	}
	
	@objc fileprivate func dismissKeyboard() {
		self.endEditing(true)
	}
	
}
