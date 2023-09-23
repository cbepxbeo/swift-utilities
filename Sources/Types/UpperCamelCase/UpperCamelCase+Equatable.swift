/*
 
 Project: SwiftUtilities
 File: UpperCamelCase+Equatable.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension UpperCamelCase: Equatable {
    public static func ==(lhs: UpperCamelCase, rhs: UpperCamelCase) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    public static func ==(lhs: UpperCamelCase, rhs: String) -> Bool {
        lhs.rawValue == rhs
    }
    public static func ==(lhs: String, rhs: UpperCamelCase) -> Bool {
        lhs == rhs.rawValue
    }
}

extension Optional where Wrapped == UpperCamelCase {
    public static func ==(lhs: Self, rhs: UpperCamelCase) -> Bool {
        switch lhs {
        case .none:
            false
        case .some(let wrapped):
            wrapped == rhs.rawValue
        }
    }
    public static func ==(lhs: UpperCamelCase, rhs: Self) -> Bool {
        switch rhs {
        case .none:
            false
        case .some(let wrapped):
            wrapped == lhs.rawValue
        }
    }
    public static func ==(lhs: Self, rhs: String) -> Bool {
        switch lhs {
        case .none:
            false
        case .some(let wrapped):
            wrapped.rawValue == rhs
        }
    }
    public static func ==(lhs: String, rhs: Self) -> Bool {
        switch rhs {
        case .none:
            false
        case .some(let wrapped):
            wrapped.rawValue == lhs
        }
    }
}
