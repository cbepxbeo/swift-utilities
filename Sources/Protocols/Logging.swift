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
}

extension Logging {
    public var logger: LoggerProvider.LoggerWrapper {
        currentLogger.withTypeLabel(type: Self.self)
    }
}
