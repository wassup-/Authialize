//
//  Authialize.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

import Foundation
import UIKit

public class Authialize {

	static private let instance = Authialize()

	internal var handlers: [URLHandler] = []

	public static func sharedInstance() -> Authialize {
		return instance
	}

	public func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
		let candidates = handlers.filter { $0.handles(url) }
		for candidate in candidates {
			if candidate.application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation) {
				return true
			}
		}

		return false
	}

}

internal extension Authialize {

	func registerHandler(handler: URLHandler) {
		handlers.append(handler)
	}

	func unregisterHandler(handler: URLHandler) {
		while let index = handlers.indexOf({ handler.compare($0) }) {
			handlers.removeAtIndex(index)
		}
	}

}
