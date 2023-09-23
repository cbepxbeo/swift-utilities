/*
 
 Project: SwiftUtilities
 File: UpperCamelCase.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

public struct UpperCamelCase {
    init(_ values: [String]) {
        self.values = values
        self.rawValue = values.reduce("") {
            $0 + $1.prefix(1).uppercased() + $1.dropFirst().lowercased()
        }
    }
    public var rawValue: String
    var values: [String]
}


