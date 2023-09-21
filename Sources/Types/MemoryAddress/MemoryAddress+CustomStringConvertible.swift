/*
 
 Project: SwiftUtilities
 File: MemoryAddress+CustomStringConvertible.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension MemoryAddress: CustomStringConvertible {
    public var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", self.value)
    }
}
