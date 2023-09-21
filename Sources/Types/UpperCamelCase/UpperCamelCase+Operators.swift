/*
 
 Project: SwiftUtilities
 File: UpperCamelCase+Operators.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension UpperCamelCase {
    public static func +(left: UpperCamelCase, right: UpperCamelCase) -> UpperCamelCase {
        UpperCamelCase(left.values + right.values)
    }
    public static func +(left: UpperCamelCase, right: String) -> UpperCamelCase {
        UpperCamelCase(left.values + UpperCamelCase(stringLiteral: right).values)
    }
    public static func +(left: String, right: UpperCamelCase) -> String {
        left + right.rawValue
    }
}
