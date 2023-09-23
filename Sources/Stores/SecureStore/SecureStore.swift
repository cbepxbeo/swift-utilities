/*

Project: SwiftUtilities
File: SecureStore.swift
Created by: Egor Boyko
Date: 04.02.2022


Status: #Complete | #Not decorated

*/

import Foundation
import Security

public final class SecureStore {
    public enum KeychainError: Error {
        case itemAlreadyExist
        case itemNotFound
        case errorStatus(String?)
        
        init(status: OSStatus) {
            switch status {
            case errSecDuplicateItem:
                self = .itemAlreadyExist
            case errSecItemNotFound:
                self = .itemNotFound
            default:
                let message = SecCopyErrorMessageString(status, nil) as String?
                self = .errorStatus(message)
            }
        }
    }
    
    public init(){}
    
    public static let main: SecureStore = .init()
    
    func addItem(query: [CFString: Any]) throws {
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
    
    func findItem(query: [CFString: Any]) throws -> [CFString: Any]? {
        var query = query
        query[kSecReturnAttributes] = kCFBooleanTrue
        query[kSecReturnData] = kCFBooleanTrue
        
        var searchResult: AnyObject?
        
        let status = withUnsafeMutablePointer(to: &searchResult) {
            SecItemCopyMatching(query as CFDictionary, $0)
        }
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        } else {
            return searchResult as? [CFString: Any]
        }
    }
    
    func updateItem(query: [CFString: Any], attributesToUpdate: [CFString: Any]) throws {
        let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
    
    func deleteItem(query: [CFString: Any]) throws {
        let status = SecItemDelete(query as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
}

public extension SecureStore  {
    
    func addValue(_ value: String, _ account: String) {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        query[kSecValueData] = value.data(using: .utf8)
        
        do {
            try addItem(query: query)
        } catch {
            return
        }
    }
    
    func getValue(_ account: String) -> String? {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        
        var result: [CFString: Any]?
        
        do {
            result = try findItem(query: query)
        } catch {
            return nil
        }
        
        if let data = result?[kSecValueData] as? Data {
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }
    
    func updateValue(_ value: String, _ account: String) {
        guard let _ = getValue(account) else {
            addValue(value, account)
            return
        }
        
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        
        var attributesToUpdate: [CFString: Any] = [:]
        attributesToUpdate[kSecValueData] = value.data(using: .utf8)
        
        do {
            try updateItem(query: query, attributesToUpdate: attributesToUpdate)
        } catch {
            return
        }
    }
    
    func deleteValue(_ account: String) {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        
        do {
            try deleteItem(query: query)
        } catch {
            return
        }
    }
    
    
}


import SwiftUI


final class ObservedApiToken: ObservableObject {
    
    static var defaultKey: String = "ddone_api_token"
    @Published var token: String? = nil
    
    var key: String
    static var main: ObservedApiToken = .init()
    
    static var storage: [String: ObservedApiToken] = [:]
    
    static func fromKey(key: String) -> ObservedApiToken{
        if let instance = self.storage[key] {
            return instance
        } else {
            let instance = ObservedApiToken(key: key)
            self.storage[key] = instance
            return instance
        }
    }
    
    
    init(key: String = ObservedApiToken.defaultKey) {
        self.key = key
        self.loadToken()
    }
    
    func loadToken() {
        self.token = SecureStore.main.getValue(key)
    }
    
    func setToken(token: String?) {
        if let token {
            SecureStore.main.updateValue(token, key)
        } else {
            SecureStore.main.deleteValue(key)
        }
        loadToken()
    }
     
}


@propertyWrapper
public struct ApiToken: DynamicProperty {
    
    
    static public func setDefaultKey(key: String){
        ObservedApiToken.defaultKey = key
        ObservedApiToken.main.key = key
        ObservedApiToken.main.loadToken()
    }
    
    private let storage : ObservedObject<ObservedApiToken>// = .init(initialValue: .main)

    
    public init(key: String? = nil) {
        if let key {
            self.storage = .init(initialValue: .fromKey(key: key))
        }
        else {
            self.storage = .init(initialValue: .main)
        }
    }
    
    public var wrappedValue: String? {
        get {
            storage.wrappedValue.token
        }
        nonmutating set {
            storage.wrappedValue.setToken(token: newValue)
        }
    }
}
