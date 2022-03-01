/*

Project: SwiftUtilities
File: AnyHashableMetatype.swift
Created by: Egor Boyko
Date: 04.02.2022


Status: #Complete | #Not decorated

*/

import Foundation

public protocol LocalizedConvertable : CaseConvertable {}

extension LocalizedConvertable {
    static public var caseDelimiter: String { "_" }
    public var key: String {
        self.name.uppercased()
    }
    public var localized: String {
        String.localized(key: self.key, defaultValue: "Empty")
    }
    public func localized(bindle: Bundle) -> String {
        String.localized(key: self.key, defaultValue: "empty", bundle: bindle)
    }
}
