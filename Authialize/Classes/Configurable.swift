//
//  Configurable.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

public protocol Configurable {

	associatedtype Configuration

	func configure(configuration configuration: Configuration)

}
