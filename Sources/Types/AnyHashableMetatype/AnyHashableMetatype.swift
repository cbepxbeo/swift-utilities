/*
 
 Project: SwiftUtilities
 File: AnyHashableMetatype.swift
 Created by: Egor Boyko
 Date: 15.05.2021
 
 Status: #Complete | #Not decorated
 
 */

public struct AnyHashableMetatype  {
    public init(_ base: Any.Type) {
        self.base = base
    }
    let base: Any.Type
}
