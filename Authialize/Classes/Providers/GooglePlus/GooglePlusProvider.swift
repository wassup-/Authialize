//
//  GooglePlusProvider.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

import Foundation
import PromiseKit

public class GooglePlusProvider: Provider {

	public typealias Configuration = GooglePlusConfiguration

    public enum Error: ErrorType {
        case failed(NSError)
        case cancelled
        case empty
    }

    private var configuration: Configuration = GooglePlusProvider.defaultConfiguration()
    private lazy var manager: GIDSignIn = GooglePlusProvider.defaultManager()

    public required init() {
        Authialize.sharedInstance().registerHandler(self)
    }

    deinit {
        Authialize.sharedInstance().unregisterHandler(self)
    }

}

extension GooglePlusProvider: URLHandler {

	func compare(other: URLHandler) -> Bool {
		guard let provider = other as? GooglePlusProvider else { return false }
		return (self === other)
	}

	func handles(url: NSURL) -> Bool {
		return false
	}

	func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return manager.handleURL(url, sourceApplication: sourceApplication, annotation: annotation)
    }

}

extension GooglePlusProvider: Configurable {

    public convenience init(configuration: Configuration) {
        self.init()
        configure(configuration: configuration)
    }

    public func configure(configuration configuration: Configuration) {
        self.configuration = configuration
    }

}

extension GooglePlusProvider: ProvidesTokens {

    public typealias Token = GooglePlusToken

    public func authenticate() -> Promise<Token> {

    }

}
