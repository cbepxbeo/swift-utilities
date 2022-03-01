/*

Project: SwiftUtilities
File: String.swift
Created by: Egor Boyko
Date: 13.12.2021


Status: #Complete | #Not decorated

*/

import Foundation

public extension String {
    static func localized(
        key: String,
        defaultValue: String = "",
        bundle: Bundle = .main
    ) -> String {
        NSLocalizedString(
            key,
            tableName: nil,
            bundle: bundle,
            value: defaultValue,
            comment: key
        )
    }
}
