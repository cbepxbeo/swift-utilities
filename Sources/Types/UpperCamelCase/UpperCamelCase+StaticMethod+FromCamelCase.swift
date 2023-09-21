/*
 
 Project: SwiftUtilities
 File: UpperCamelCase+StaticMethod+FromCamelCase.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension UpperCamelCase {
    static func fromCamelCase(input: String) -> [String] {
        input.reduce([String]()) { partial, item in
            if partial.isEmpty { return [item.lowercased()] }
            if item.uppercased() == String(item) { return partial + [item.lowercased()] }
            var copy = partial
            copy[copy.count - 1] = copy[copy.count - 1] + item.lowercased()
            return copy
        }
    }
}
