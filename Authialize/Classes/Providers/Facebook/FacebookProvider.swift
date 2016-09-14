//
//  FacebookProvider.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

import Foundation
import FBSDKLoginKit
import PromiseKit

public class FacebookProvider: Provider {

	public typealias Configuration = FacebookConfiguration

	public enum Error: ErrorType {
		case failed(NSError)
		case cancelled
		case empty(FBSDKLoginManagerLoginResult)
	}

	private var configuration: Configuration = FacebookProvider.defaultConfiguration()
	private lazy var loginManager: FBSDKLoginManager = FacebookProvider.defaultLoginManager()

	public required init() {
		Authialize.sharedInstance().registerHandler(self)
	}

	deinit {
		Authialize.sharedInstance().unregisterHandler(self)
	}

}

extension FacebookProvider: URLHandler {

	func compare(other: URLHandler) -> Bool {
		guard let other = other as? FacebookProvider else { return false }
		return (self === other)
	}

	func handles(url: NSURL) -> Bool {
		return true
	}

	func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
		return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
	}



}

extension FacebookProvider: Configurable {

	public convenience init(configuration: Configuration) {
		self.init()
		configure(configuration: configuration)
	}

	public func configure(configuration configuration: Configuration) {
		self.configuration = configuration
	}

}

extension FacebookProvider: ProvidesTokens {

	public typealias Token = FacebookToken

	public func authenticate() -> Promise<Token> {
		if let fbtoken = FBSDKAccessToken.currentAccessToken() {
			let token: Token = Token(token: fbtoken)
			return Promise<Token>(token)
		} else {
			let configuration = self.configuration
			let loginManager = self.loginManager

			return Promise<Token> { fulfill, reject in
				loginManager.logInWithReadPermissions(configuration.readPermissions, fromViewController: configuration.sourceViewController) { result, error in
					if let error = error {
						reject(Error.failed(error))
					} else if result.isCancelled {
						reject(Error.cancelled)
					} else if let fbtoken = result.token {
						let token: Token = Token(token: fbtoken)
						fulfill(token)
					} else {
						reject(Error.empty(result))
					}
				}
			}
		}
	}

}
