/*

Project: SwiftUtilities
File: AnyHashableMetatype.swift
Created by: Egor Boyko
Date: 04.02.2022


Status: #Complete | #Not decorated

*/

import Foundation

fileprivate let currentLogger = LoggerProvider.default(category: "logging")

public protocol Logging {
    var logger: LoggerProvider.LoggerWrapper { get }
    var loggerCategory: String? { get }
}

extension Logging {
    public var loggerCategory: String? {
        nil
    }
    public var logger: LoggerProvider.LoggerWrapper {
        if let loggerCategory {
            return LoggerProvider.default(category: fromCamelCase(value: loggerCategory))
        } else {
            return currentLogger.withTypeLabel(type: Self.self)
        }
    }
}
