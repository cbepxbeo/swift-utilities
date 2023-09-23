/*
 
 Project: SwiftUtilities
 File: SecureStoreValueProvider.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

final class SecureStoreValueProvider: ObservableObject {
    init(key: String = SecureStoreValueProvider.defaultKey) {
        self.key = key
        self.load()
    }
    
    @Published var value: String? = nil
    var key: String
    
    func load() {
        self.value = SecureStore.main.search(account: key)
    }
    
    func set(value: String?) {
        if let value {
            SecureStore.main.update(value: value, account: self.key)
        } else {
            SecureStore.main.delete(account: self.key)
        }
        self.load()
    }
}
