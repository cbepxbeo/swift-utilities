/*
 
 Project: SwiftUtilities
 File: UpperCamelCase+Hashable.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension UpperCamelCase: Hashable {
    public func hash(into hasher: inout Hasher) {
        self.rawValue.hash(into: &hasher)
    }
}
