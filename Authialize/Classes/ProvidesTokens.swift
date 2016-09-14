//
//  ProvidesTokens.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

import PromiseKit

public protocol ProvidesTokens {

	associatedtype Token

    func authenticate() -> Promise<Token>

}

public extension ProvidesTokens where Self: RequiresCredentials {

	public func authenticateWithCredentials(credentials: Credentials) -> Promise<Token> {
		configure(credentials: credentials)
		return authenticate()
	}

}
