/*

Project: SwiftUtilities
File: FileProviderPath.swift
Created by: Egor Boyko
Date: 15.05.2021


Status: #Complete | #Not decorated

*/

import Foundation

public protocol FileProviderPath: CustomStringConvertible, RawRepresentable, CaseIterable {}

extension FileProviderPath {
    
    public var description: String {
        "\(Self.self): \(self.value)"
    }
    
    internal var value: String {
        if let string = self.rawValue as? String {
            return string
        } else { fatalError("---") }
    }
}
