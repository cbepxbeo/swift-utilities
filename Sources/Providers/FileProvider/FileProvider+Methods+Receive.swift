/*
 
 Project: SwiftUtilities
 File: FileProvider+Methods+Receive.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension FileProvider {
    
    public func receive(from directory: T, fileName: String) -> NSData? {
        let filePath = self.path(directory).appendingPathComponent(fileName)
        guard FileManager.default.fileExists(atPath: filePath.path) else { return nil }
        return NSData(contentsOfFile: filePath.path)
    }
    
    public func receive(from directory: T, fileName: String) -> Data? {
        if let nsData: NSData = self.receive(from: directory, fileName: fileName){
            Data(referencing: nsData)
        } else {
            nil
        }
    }
    
    public func receive(
        from directory: T,
        fileName: String,
        completion: @escaping (_ nsData: NSData?) -> ()){
            DispatchQueue.global(qos: .background).async {
                completion(self.receive(from: directory, fileName: fileName))
            }
    }
    
    public func receive(
        from directory: T,
        fileName: String,
        completion: @escaping (_ data: Data?) -> ()){
            DispatchQueue.global(qos: .background).async {
                completion(self.receive(from: directory, fileName: fileName))
            }
    }
    
    
    
    
    
}
