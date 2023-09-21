/*
 
 Project: SwiftUtilities
 File: UpperCamelCase+ExpressibleByStringLiteral.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension UpperCamelCase: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value.split(separator: " ").flatMap {
            Self.fromCamelCase(input: String($0))
        })
    }
}
