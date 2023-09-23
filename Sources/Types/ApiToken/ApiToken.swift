/*
 
 Project: SwiftUtilities
 File: ApiToken.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation
import SwiftUI

@propertyWrapper
public struct ApiToken: DynamicProperty {
    let storage : ObservedObject<SecureStoreValueProvider>
    
    public init(key: String? = nil) {
        if let key {
            self.storage = .init(initialValue: .from(key: key))
        }
        else {
            self.storage = .init(initialValue: .default)
        }
    }

    public var wrappedValue: String? {
        get {
            storage.wrappedValue.value
        }
        nonmutating set {
            storage.wrappedValue.set(value: newValue)
        }
    }
}
