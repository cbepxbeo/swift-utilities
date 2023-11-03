/*
 
 Project: SwiftUtilities
 File: String+Method+Index.swift
 Created by: Egor Boyko
 Date: 22.10.2023
 
 Status: #Complete | #Not decorated
 
 */

public extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
}
