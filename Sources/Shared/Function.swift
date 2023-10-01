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

/// Execute scoped modifications to `arg`.
///
/// Useful when multiple modifications need to be made to a single nested property. For example,
/// ```
/// view.frame.origin.x -= view.frame.width / 2
/// view.frame.origin.y -= view.frame.height / 2
/// ```
/// can be rewritten as
/// ```
/// mutate(&view.frame) {
///   $0.origin.x -= $0.width / 2
///   $0.origin.y -= $0.height / 2
/// }
/// ```
///
public func mutate<T>(_ arg: inout T, _ body: (inout T) -> Void) {
  body(&arg)
}


public func saveAction() -> (@escaping () -> ()) -> (()->())? {
    var temp: (() -> ())? = nil
    func save(_ action: @escaping () -> ()) -> (()->())?{
        if temp == nil {
            temp = action
        }
        return temp
    }
    return save
}

public func assign<T: Hashable>(to: inout T, of: T){
    if to != of { to = of }
}
