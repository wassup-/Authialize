//
//  FacebookProvider+Private.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

import Foundation
import FBSDKLoginKit

internal extension FacebookProvider {

    static func defaultConfiguration() -> Configuration {
        var configuration = Configuration()
        configuration.readPermissions = [
            "public_profile"
        ]
        return configuration
    }

    static func defaultLoginManager() -> FBSDKLoginManager {
        let manager = FBSDKLoginManager()
        return manager
    }

}
