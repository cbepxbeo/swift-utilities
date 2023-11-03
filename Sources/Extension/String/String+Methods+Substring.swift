/*
 
 Project: SwiftUtilities
 File: String+Methods+Substring.swift
 Created by: Egor Boyko
 Date: 22.10.2023
 
 Status: #Complete | #Not decorated
 
 */

public extension String {
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    func substring(with range: Range<Int>) -> String {
        let startIndex = index(from: range.lowerBound)
        let endIndex = index(from: range.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
