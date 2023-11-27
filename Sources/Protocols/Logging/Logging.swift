/*
 
 Project: SwiftUtilities
 File: Logging.swift
 Created by: Egor Boyko
 Date: 04.02.2022
 
 Status: #Complete | #Not decorated
 
 */

import OSLog

public protocol Logging {
    static var logger: Logger { get }
    static var loggerCategory: String? { get }
    var logger: Logger { get }
    @available(*,deprecated, message: "Use static var loggerCategory")
    var loggerCategory: String? { get }
}
