/*

Project: SwiftUtilities
File: ValueContainer.swift
Created by: Egor Boyko
Date: 21.05.2023

Status: #Complete | #Not decorated

*/

public struct ValueContainer<T> {
    public init(_ value: T) {
        self.value = value
    }
    public let value: T
}
