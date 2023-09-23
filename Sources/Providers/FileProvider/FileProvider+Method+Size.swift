/*
 
 Project: SwiftUtilities
 File: FileProvider+Method+Size.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension FileProvider {
    public func size(
        of directory: T,
        _ completion: @escaping (_ size: DirectorySize) -> () = { _ in }) {
            DispatchQueue.global(qos: .background).async { [unowned self] in
                guard let files = try? FileManager.default.contentsOfDirectory(atPath: self.path(directory).path) else {
                    completion(.init(0))
                    return
                }
                let summ: UInt64 = files.reduce(0) {
                    $0 + self.path(directory).appendingPathComponent($1).size.uInt64
                }
                completion(.init(summ))
            }
        }
}
