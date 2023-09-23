/*
 
 Project: SwiftUtilities
 File: Mirrorable+Implementation.swift
 Created by: Egor Boyko
 Date: 22.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension Mirrorable {
    public var mirror: (label: String, params: [String: Any]) {
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
