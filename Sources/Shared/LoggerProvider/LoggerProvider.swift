/*

Project: SwiftUtilities
File: LoggerProvider.swift
Created by: Egor Boyko
Date: 02.03.2021

*/

import OSLog

public struct LoggerProvider {
    public static func `default`(category: String) -> LoggerProvider.LoggerWrapper {
        if let logger = self.storage[category] {
            return logger
        }
        let logger: LoggerProvider.LoggerWrapper = .init(category: category)
        self.storage[category] = logger
        return logger
    }
    internal static var storage: [String: LoggerProvider.LoggerWrapper] = [:]
}
