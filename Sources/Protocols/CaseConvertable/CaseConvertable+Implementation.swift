/*
 
 Project: SwiftUtilities
 File: CaseConvertable+Implementation.swift
 Created by: Egor Boyko
 Date: 22.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension CaseConvertable {
    var output: String {
        (UpperCamelCase(describing: Self.self) + UpperCamelCase(stringLiteral: self.rawValue)).transform(separator: Self.caseSeparator)
    }
}
