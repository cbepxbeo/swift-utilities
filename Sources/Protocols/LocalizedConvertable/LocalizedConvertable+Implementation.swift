/*
 
 Project: SwiftUtilities
 File: LocalizedConvertable+Implementation.swift
 Created by: Egor Boyko
 Date: 22.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension LocalizedConvertable {
    public static var caseDelimiter: String { "_" }
    public var key: String {
        self.output.uppercased()
    }
    public var localized: String {
        String.localized(key: self.key)
    }
    public func localized(bindle: Bundle) -> String {
        String.localized(key: self.key, bundle: bindle)
    }
}
