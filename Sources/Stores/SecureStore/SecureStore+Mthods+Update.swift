/*
 
 Project: SwiftUtilities
 File: SecureStore+Mthods+Update.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension SecureStore {
    public func update(item query: [CFString: Any], attributesToUpdate: [CFString: Any]) throws {
        let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
    
    public func update(value: String, account: String) {
        guard let _ = self.search(account: account) else {
            self.add(value: value, account: account)
            return
        }

        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        
        var attributesToUpdate: [CFString: Any] = [:]
        attributesToUpdate[kSecValueData] = value.data(using: .utf8)
        
        do {
            try self.update(item: query, attributesToUpdate: attributesToUpdate)
        } catch {
            return
        }
    }
    
}
