/*
 
 Project: SwiftUtilities
 File: CaseConvertable.swift
 Created by: Egor Boyko
 Date: 22.09.2023
 
 Status: #Complete | #Not decorated
 
 */

public protocol CaseConvertable: RawRepresentable, CaseIterable
where RawValue == String {
    static var caseSeparator: String { get }
}
