/*
 
 Project: SwiftUtilities
 File: URL+Property+Size.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension URL {
    public var size: URL.Size {
        guard let size = self.size() else {
            return .init(size: 0)
        }
        return size
    }
}
