/*
 
 Project: SwiftUtilities
 File: AssetConvertable+Implementation.swift
 Created by: Egor Boyko
 Date: 22.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension AssetConvertable {
    static public var caseSeparator: String { "-" }
    
    public var assetName: String {
        self.output
    }
}
