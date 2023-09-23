/*
 
 Project: SwiftUtilities
 File: Logging.swift
 Created by: Egor Boyko
 Date: 04.02.2022
 
 Status: #Complete | #Not decorated
 
 */

public protocol Logging {
    var logger: LoggerProvider.LoggerWrapper { get }
    var loggerCategory: String? { get }
}
