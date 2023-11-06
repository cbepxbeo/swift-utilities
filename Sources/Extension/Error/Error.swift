/*
 
 Project: SwiftUtilities
 File: Error+Method+Code.swift
 Created by: Egor Boyko
 Date: 06.11.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

public extension Error {
    func code() -> Int? { (self as NSError).code }
}
