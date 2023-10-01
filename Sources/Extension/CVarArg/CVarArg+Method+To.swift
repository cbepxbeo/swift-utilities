/*
 
 Project: SwiftUtilities
 File: CVarArg+Method+To.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

public extension CVarArg {
    func to(afterPoint: Int) -> String {
        String(format: "%.\(afterPoint)f", self)
    }
}

