//
//  RequiresCredentials.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

public protocol RequiresCredentials {

	associatedtype Credentials

	func configure(credentials credentials: Credentials)

}
