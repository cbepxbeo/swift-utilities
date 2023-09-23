/*
 
 Project: SwiftUtilities
 File: Logging+Implementation.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #Complete | #Not decorated
 
 */

import OSLog

fileprivate let currentLogger = LoggerProvider.default(category: "logging")

extension Logging {
    public var loggerCategory: String? { nil }
    
    public var logger: Logger {
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
    
    func debugLog(
        _ messages: [String],
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
            --------
            \(message)
            """
            self.logger.debug("\(output)")
        }
    
    public func debugLog(
        _ messages: String...,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line){
#if DEBUG//-----------------------------------------------------------------------------------------
            self.debugLog(
                messages,
                functionName: functionName,
                fileName: fileName,
                lineNumber: lineNumber
            )
#endif//--------------------------------------------------------------------------------------------
        }
    
}
