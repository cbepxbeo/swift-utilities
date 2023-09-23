/*
 
 Project: SwiftUtilities
 File: String+Init+FromUpperCamelCase.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension String {
    public init(upperCamelCase value: UpperCamelCase) {
        self.init(value.rawValue)
    }
}
