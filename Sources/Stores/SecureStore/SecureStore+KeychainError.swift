/*
 
 Project: SwiftUtilities
 File: SecureStore+KeychainError.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension SecureStore {
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
}
