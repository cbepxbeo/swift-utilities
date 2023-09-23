/*
 
 Project: SwiftUtilities
 File: MemoryAddress+Init+ClassInstance.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension MemoryAddress where T: AnyObject {
    public init(of classInstance: T) {
        self.init(value: unsafeBitCast(classInstance, to: Int.self))
    }
}
