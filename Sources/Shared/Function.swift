/*
 
 Project: SwiftUtilities
 File: Function.swift
 Created by: Egor Boyko
 Date: 24.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

@inlinable
public func toMainThread(_ closure: @escaping () -> ()){
    if Thread.isMainThread {
        closure()
    } else {
        DispatchQueue.main.async {
            closure()
        }
    }
}
