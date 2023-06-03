/*

Project: SwiftUtilities
File: UniversalWrap.swift
Created by: Egor Boyko
Date: 21.05.2023

Status: #Complete | #Not decorated

*/

public struct ValueWrapper<T> {
    public init(_ value: T) {
        self.value = value
    }
    
    public let value: T
}
