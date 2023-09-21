/*
 
 Project: SwiftUtilities
 File: MemoryAddress+Init+StructPointer.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension MemoryAddress {
    public init(of structPointer: UnsafePointer<T>) {
        self.init(value: Int(bitPattern: structPointer))
    }
}
