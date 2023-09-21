/*
 
 Project: SwiftUtilities
 File: AnyHashableMetatype+Equatable.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension AnyHashableMetatype: Equatable {
    public static func ==(lhs: AnyHashableMetatype, rhs: AnyHashableMetatype) -> Bool {
        return lhs.base == rhs.base
    }
}
