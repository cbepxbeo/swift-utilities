/*
 
 Project: SwiftUtilities
 File: URLComponents+Method+Add.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension URLComponents {
    public mutating func add(toPath part: String){
        self.path += "/" + part
    }
}
