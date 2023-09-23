/*
 
 Project: SwiftUtilities
 File: String+StaticMethod+Localized.swift
 Created by: Egor Boyko
 Date: 13.12.2021
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension String {
    public static func localized(
        key: String,
        defaultValue: String? = nil,
        bundle: Bundle = .main
    ) -> String {
        NSLocalizedString(
            key,
            tableName: nil,
            bundle: bundle,
            value: defaultValue ?? key,
            comment: key
        )
    }
}
