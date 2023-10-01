/*
 
 Project: SwiftUtilities
 File: Bundle+StaticProperty+Identifier.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension Bundle {
    static public var identifier : String {
        Bundle.main.bundleIdentifier ?? "unknow"
    }
}
