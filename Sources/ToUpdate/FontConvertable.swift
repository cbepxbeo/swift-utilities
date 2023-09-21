/*

Project: SwiftUtilities
File: FontConvertable.swift
Created by: Egor Boyko
Date: 04.02.2022


Status: #Complete | #Not decorated

*/

import Foundation


public protocol FontConvertable: CaseConvertable {}

extension FontConvertable {
    static public var caseDelimiter: String { "-" }
    static public var isFirstLetterUp: Bool { true }
    static public var fontName: String { .init(describing: Self.self) }
}
