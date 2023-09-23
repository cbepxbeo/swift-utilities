/*
 
 Project: SwiftUtilities
 File: FileProvider+Methods+Save.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension FileProvider {
    public func save(
        to directory: T,
        fileName: String,
        _ data: Data,
        completion: @escaping (_ status: Bool) -> () = { _ in }){
            DispatchQueue.global(qos: .background).async {
                do {
                    try data.write(to: self.path(directory).appendingPathComponent(fileName))
                    completion(true)
                }
                catch {
                    completion(false)
                }
            }
        }
}
