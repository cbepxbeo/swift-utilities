/*
 
 Project: SwiftUtilities
 File: Array+Methods+Replace.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension Array {
    @MainActor
    public mutating func replace(
        contentsOf newElements: [Element],
        slice: (from: Index, to: Index)){
            self.replace(contentsOf: newElements, from: slice.from, to: slice.to)
    }
    
    @MainActor
    public mutating func replace(
        element: Element,
        from: Index? = nil,
        to: Index? = nil){
            self.replace(contentsOf: [element], from: from, to: to)
    }
    
    @MainActor
    public mutating func replace(
        contentsOf newElements: [Element],
        of: Index){
            if newElements.isEmpty {
                return
            }
            
            if newElements.count == 1, !self.isEmpty, let first = newElements.first {
                let index = of < 0 ? 0 : of > self.count - 1 ? self.count - 1 : of
                self[index] = first
                return
            }
            
            if of > self.count - 1 {
                self.removeLast()
                self += newElements
                return
            }
            
            self.replace(contentsOf: newElements, from: of, to: (newElements.count - 1) + of)
    }
    
    @MainActor
    public mutating func replace(
        contentsOf newElements: [Element],
        from: Index? = nil,
        to: Index? = nil){
            if self.isEmpty || self.count == 1 {
                self = newElements
                return
            }
            
            let end: Index
            if let to {
                end = self.count - 1 < to ? self.count - 1 : to
            } else {
                end = self.count - 1
            }
            
            let start: Index
            if let from {
                start = from < 0 ? 0 : from >= end ? end - 1 : from
            } else {
                start = 0
            }
            
            if newElements.count == 0 {
                self[start...end] = []
                return
            }
            
            if newElements.count == 1, let first = newElements.first {
                self[start...end] = [first]
                return
            }
            self[start...end] = newElements[0...(newElements.count - 1)]
    }
}
