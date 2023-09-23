/*
 
 Project: SwiftUtilities
 File: UpperCamelCase+Method+Transform.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension UpperCamelCase {
    public func transform(
        separator: String = " ",
        option: UpperCamelCase.Option = .lower) -> String {
        values.reduce("") {
            let output: String
            switch option {
            case .lower:
                output = $1.lowercased()
            case .upper:
                output = $1.uppercased()
            }
            return $0.isEmpty ? $0 + output : $0 + separator + output
        }
    }
}
