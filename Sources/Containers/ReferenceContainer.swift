/*

Project: SwiftUtilities
File: ReferenceContainer.swift
Created by: Egor Boyko
Date: 03.06.2023

Status: #Complete | #Not decorated

*/

public final class ReferenceContainer<T> {
    public init(_ value: T) {
        self.value = value
    }
    public var value: T
}
