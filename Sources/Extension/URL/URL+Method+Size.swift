/*
 
 Project: SwiftUtilities
 File: URL+Method+Size.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension URL {
    func size(input: UInt64? = nil) -> URL.Size? {
        guard let input else {
            guard let size = try? FileManager.default.attributesOfItem(
                atPath: path
            )[FileAttributeKey.size],
                  let fileSize = size as? UInt64 else {
                return nil
            }
            return .init(size: fileSize)
        }
        return .init(size: input)
    }
}
