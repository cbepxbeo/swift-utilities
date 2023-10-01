/*
 
 Project: SwiftUtilities
 File: String+Property+Md5.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import CryptoKit

extension String {
    public var md5: String {
        Insecure.MD5.hash(data: self.data(using: .utf8)!).map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
