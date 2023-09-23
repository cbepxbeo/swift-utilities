/*
 
 Project: SwiftUtilities
 File: FileProvider+StaticMethod+Create.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension FileProvider {
    static func create(directory: String) -> URL {
        let manager: FileManager, cachesDirectory: URL, newDirectory: URL
        manager = .default

        do {
            cachesDirectory = try manager.url(
                for: FileManager.SearchPathDirectory.cachesDirectory,
                   in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil,
                   create: true)
        } catch {
            fatalError("Get cachesDirectory \(directory)")
        }

        newDirectory = cachesDirectory.appendingPathComponent(directory)

        if !manager.fileExists(atPath: newDirectory.path){
            do {
                try manager.createDirectory(at: newDirectory, withIntermediateDirectories: false, attributes: nil)
            }
            catch {
                fatalError("Create directory \(directory)")
            }
        }
        return newDirectory
    }
}
