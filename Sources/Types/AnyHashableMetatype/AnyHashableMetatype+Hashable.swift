/*
 
 Project: SwiftUtilities
 File: AnyHashableMetatype+Hashable.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension AnyHashableMetatype: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self.base))
    }
}
