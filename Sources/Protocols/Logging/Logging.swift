/*
 
 Project: SwiftUtilities
 File: Logging.swift
 Created by: Egor Boyko
 Date: 04.02.2022
 
 Status: #Complete | #Not decorated
 
 */

import OSLog

public protocol Logging {
    var logger: Logger { get }
    var loggerCategory: String? { get }
}
