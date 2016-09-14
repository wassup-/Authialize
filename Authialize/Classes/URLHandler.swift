//
//  URLHandler.swift
//  Authialize
//
//  Created by Tom Knapen on 13/09/16.
//
//

internal protocol URLHandler {

    func compare(other: URLHandler) -> Bool

    func handles(url: NSURL) -> Bool
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool

}
