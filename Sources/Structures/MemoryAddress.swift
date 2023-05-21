/*

Project: SwiftUtilities
File: MemoryAddress.swift
Created by: Egor Boyko
Date: 21.05.2023

Status: #Complete | #Not decorated

*/

import Foundation

public struct MemoryAddress<T>: CustomStringConvertible {

    public let intValue: Int

    public var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }
    public init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

extension MemoryAddress where T: AnyObject {
    public init(of classInstance: T) {
        intValue = unsafeBitCast(classInstance, to: Int.self)
    }
}
