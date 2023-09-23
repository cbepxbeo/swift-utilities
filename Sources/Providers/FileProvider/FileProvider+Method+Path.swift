/*
 
 Project: SwiftUtilities
 File: FileProvider+Method+Path.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Completed | #Not decorated
 
 */

import Foundation

extension FileProvider {
    func path(_ directory: T) -> URL {
        if let path = self.paths[directory.rawValue] {
            return path
        }
        let path = Self.create(directory: directory.rawValue)
        self.paths[directory.rawValue] = path
        return path
    }
}
