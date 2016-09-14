//
//  GooglePlusProvider+Private.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

internal extension GooglePlusProvider {

	static func defaultConfiguration() -> Configuration {
		let configuration = Configuration()
		return configuration
	}
	
	static func defaultManager() -> GIDSignIn {
		let manager: GIDSignIn = GIDSignIn.sharedInstance()
		return manager
	}
	
}
