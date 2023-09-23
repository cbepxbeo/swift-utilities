/*
 
 Project: SwiftUtilities
 File: FileProvider+StaticMethod+Paths.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension FileProvider {
    static func paths() -> [String : URL] {
        var temp: [String : URL] = [:]
        T.allCases.forEach {
            temp[$0.rawValue] = self.create(directory: $0.rawValue)
        }
        return temp
    }
}
