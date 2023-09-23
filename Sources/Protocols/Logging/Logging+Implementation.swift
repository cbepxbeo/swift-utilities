/*
 
 Project: SwiftUtilities
 File: Logging+Implementation.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

fileprivate let currentLogger = LoggerProvider.default(category: "logging")

extension Logging {
    public var loggerCategory: String? { nil }
    public var logger: LoggerProvider.LoggerWrapper {
        if let loggerCategory {
            LoggerProvider.default(
                category: UpperCamelCase(
                    stringLiteral: loggerCategory
                ).transform(separator: "-")
            )
        } else {
            currentLogger.withTypeLabel(type: Self.self)
        }
    }
}
