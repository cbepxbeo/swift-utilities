/*

Project: SwiftUtilities
File: AnyHashableMetatype.swift
Created by: Egor Boyko
Date: 15.05.2021


Status: #Complete | #Not decorated

*/

public struct AnyHashableMetatype : Hashable {
    
    public static func ==(lhs: AnyHashableMetatype, rhs: AnyHashableMetatype) -> Bool {
        return lhs.base == rhs.base
    }
    
    let base: Any.Type
    
    public init(_ base: Any.Type) {
        self.base = base
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(base))
    }
}
