/*
 
 Project: SwiftUtilities
 File: FileProvider+DirectorySize.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension FileProvider {
    public struct DirectorySize: CustomStringConvertible {
        public let size: UInt64
        public var description: String {
            size == 0 ? "Counting in progress..." : URL.Size(size: size).description
        }
        public init(_ size: UInt64 = 0){
            self.size = size
        }
    }
}
