/*

Project: SwiftUtilities
File: AnyHashableMetatype.swift
Created by: Egor Boyko
Date: 24.06.2021


Status: #Complete | #Not decorated

*/

import Foundation

public protocol Mirrorable { }

extension Mirrorable {
    public var mirror: (label: String, params: [String: Any]) {
        get {
            let reflection = Mirror(reflecting: self)
            guard reflection.displayStyle == .enum,
                let associated = reflection.children.first,
                  let label = associated.label else {
                    return ("\(self)", [:])
            }
            let values = Mirror(reflecting: associated.value).children
            var valuesDictionary: [String: Any] = [:]
            for case let item in values where item.label != nil {
                valuesDictionary[item.label!] = item.value
            }
            return (label, valuesDictionary)
        }
    }
}
