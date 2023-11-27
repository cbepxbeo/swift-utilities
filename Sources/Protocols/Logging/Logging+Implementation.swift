/*
 
 Project: SwiftUtilities
 File: Logging+Implementation.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import OSLog

fileprivate let currentLogger = LoggerProvider.default(category: "logging")

public enum LoggingOption {
    case debug
    case info
    case warning
    case error
}

extension Logging {
    public static var loggerCategory: String? { nil }
    public var loggerCategory: String? { nil }
    
    public static var logger: Logger {
        if let loggerCategory {
            LoggerProvider.default(
                category: UpperCamelCase(
                    stringLiteral: loggerCategory
                ).transform(separator: "-")
            ).value
        } else {
            currentLogger.value
        }
    }
    
    public var logger: Logger {
        Self.logger
    }
    
    static func log(
        _ messages: [String],
        option: LoggingOption,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line){
            let date = Date()
            let message: String = messages.reduce("") { $0 + $1 + " " }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            
            let time = dateFormatter.string(from: date)
            let interval = "\(date.timeIntervalSince1970)".split(separator: ".").last ?? ""

            let output = """
            Time: \(time).\(interval)
            Type: \(Self.self)
            File: \(fileName.split(separator: "/").last ?? "")
            Line: \(lineNumber)
            Function: \(functionName)
            Thread: \(Thread.current)
            
            \(message)
            """
            switch option {
            case .debug:
                self.logger.debug("\(output)")
            case .info:
                self.logger.info("\(output)")
            case .warning:
                self.logger.warning("\(output)")
            case .error:
                self.logger.error("\(output)")
            }
           
        }
    
    public static func debugLog(
        _ messages: String...,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line){
#if DEBUG//-----------------------------------------------------------------------------------------
            self.log(
                messages,
                option: .debug,
                functionName: functionName,
                fileName: fileName,
                lineNumber: lineNumber
            )
#endif//--------------------------------------------------------------------------------------------
        }
    
    public func debugLog(
        _ messages: String...,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line){
            Self.log(
                messages,
                option: .debug,
                functionName: functionName,
                fileName: fileName,
                lineNumber: lineNumber
            )
        }
    
    
    
    public func log(
        _ messages: String...,
        option: LoggingOption,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line){
            Self.log(
                messages,
                option: option,
                functionName: functionName,
                fileName: fileName,
                lineNumber: lineNumber
            )
        }
    
    public static func log(
        _ messages: String...,
        option: LoggingOption,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line){
            self.log(
                messages,
                option: option,
                functionName: functionName,
                fileName: fileName,
                lineNumber: lineNumber
            )
        }
    
}
