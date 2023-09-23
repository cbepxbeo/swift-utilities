/*
 
 Project: SwiftUtilities
 File: SecureStore+Mthods+Add.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension SecureStore {
    public func add(item query: [CFString: Any]) throws {
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
    
    public func add(value: String, account: String) {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        query[kSecValueData] = value.data(using: .utf8)
        do {
            try add(item: query)
        } catch {
            return
        }
    }
}
