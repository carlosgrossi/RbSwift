//
//  UINavigationController.swift
//  RbSwift
//
//  Created by Carlos Grossi on 16/06/17.
//  Copyright © 2017 draveness. All rights reserved.
//

import UIKit

public extension UINavigationController {
	
	open override var shouldAutorotate: Bool {
		return visibleViewController?.shouldAutorotate ?? true
	}
	
	open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return visibleViewController?.supportedInterfaceOrientations ?? .all
	}
	
	public func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		pushViewController(viewController, animated: animated)
		CATransaction.commit()
	}
	
	public var tabBarHeight: CGFloat? {
		get {
			return tabBarController?.tabBar.bounds.height
		}
	}
	
	public func fadeTitle(to title: String, withDuration: TimeInterval = 0.1) {
		let fadeTransition = CATransition()
		fadeTransition.type = kCATransitionFade
		fadeTransition.duration = withDuration
		self.navigationBar.layer.add(fadeTransition, forKey: "fadeText")
		self.viewControllers.first?.navigationItem.title = title
	}
	
}
