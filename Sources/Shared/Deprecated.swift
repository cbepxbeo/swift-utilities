/*
 
 Project: SwiftUtilities
 File: Deprecated.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension FontRegistrator {
    @available(*,deprecated, renamed: "register", message: "The method has been renamed")
    public func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        self.register(bundle: bundle, name: fontName, extension: fontExtension)
    }
}

@available(*,deprecated, message: "Use UpperCamelCase type. Method transform")
public func fromCamelCase(value: String, separator: String = "-") -> String {
    "" //TODO: Call UpperCamelCase
}
