/*
 
 Project: SwiftUtilities
 File: FontConvertable+Implementation.swift
 Created by: Egor Boyko
 Date: 22.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension FontConvertable {
    static public var caseSeparator: String { "-" }
    public static var fontName: String {
        "\(Self.self)"
    }
    public var fontName: String {
        self.output
    }
}
