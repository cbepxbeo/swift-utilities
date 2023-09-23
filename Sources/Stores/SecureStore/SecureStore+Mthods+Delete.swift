/*
 
 Project: SwiftUtilities
 File: SecureStore+Mthods+Delete.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension SecureStore {
    public func delete(item query: [CFString: Any]) throws {
        let status = SecItemDelete(query as CFDictionary)
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
    
    public func delete(account: String) {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        
        do {
            try self.delete(item: query)
        } catch {
            return
        }
    }
}
