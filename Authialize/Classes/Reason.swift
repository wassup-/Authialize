//
//  Reason.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

public enum Reason: ErrorType {

	case noReason
	case unknownReason
	case error(NSError)

}
