/*
 
 Project: SwiftUtilities
 File: SecureStoreValueProvider+StaticImplementation.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension SecureStoreValueProvider {
    static var `default`: SecureStoreValueProvider = .init()
    static var storage: [String: SecureStoreValueProvider] = [:]
    static var defaultKey: String = Bundle.main.bundleIdentifier ?? "secure_api_token"
    
    static func from(key: String) -> SecureStoreValueProvider{
        if let instance = self.storage[key] {
            return instance
        } else {
            let instance = SecureStoreValueProvider(key: key)
            self.storage[key] = instance
            return instance
        }
    }
}
