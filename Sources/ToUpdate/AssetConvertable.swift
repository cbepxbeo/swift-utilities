/*

Project: SwiftUtilities
File: AssetConvertable.swift
Created by: Egor Boyko
Date: 14.12.2021


Status: #Complete | #Not decorated

*/


import Foundation

public protocol AssetConvertable: CaseConvertable {}

extension AssetConvertable {
    static public var caseDelimiter: String { "-" }
    public var assetName: String {
        self.name
    }
}
