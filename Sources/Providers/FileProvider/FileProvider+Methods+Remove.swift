/*
 
 Project: SwiftUtilities
 File: FileProvider+Methods+Remove.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension FileProvider {
    public func remove(
        from directory: T,
        _ completion: @escaping (_ status: Bool) -> () = { _ in }){
            let fileManager = FileManager.default
            DispatchQueue.global(qos: .background).async { [unowned self] in
                guard let files = try? fileManager.contentsOfDirectory(atPath: self.path(directory).path) else {
                    completion(false)
                    return
                }
                do {
                    try files.forEach {
                        try fileManager.removeItem(
                            at: self.path(directory).appendingPathComponent($0)
                        )
                    }
                } catch{
                    completion(false)
                }
            }
        }
}
