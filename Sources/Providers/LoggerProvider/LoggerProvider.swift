/*
 
 Project: SwiftUtilities
 File: LoggerProvider.swift
 Created by: Egor Boyko
 Date: 02.03.2021
 
 */

import OSLog

public struct LoggerProvider {
    public static func `default`(category: String) -> ReferenceContainer<Logger> {
        if let logger = self.storage[category] {
            return logger
        }
        let logger: ReferenceContainer<Logger> = .init(
            .init(
                subsystem: Bundle.main.bundleIdentifier ?? "--",
                category: category
            )
        )
        self.storage[category] = logger
        return logger
    }
    static var storage: [String: ReferenceContainer<Logger>] = [:]
}
