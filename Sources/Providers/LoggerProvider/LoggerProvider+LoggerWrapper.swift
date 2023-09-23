/*
 
 Project: SwiftUtilities
 File: LoggerProvider+LoggerWrapper.swift
 Created by: Egor Boyko
 Date: 02.03.2021
 
*/

import Foundation
import OSLog



extension LoggerProvider {
    public final class LoggerWrapper{
        
        internal init(category: String){
            if let value = loggerStorage[category] {
                self.logger = value
            } else {
                self.logger = .init(subsystem: Bundle.main.bundleIdentifier ?? "--", category: category)
            }
            self.category = category
        }
        
        private let category: String
        
        func copy() -> LoggerWrapper {
            let logger = LoggerWrapper(category: self.category)
            logger.label = self.label
            logger.typeName = self.typeName
            return logger
        }
        let logger: Logger
        
        var label: String? = nil
        var typeName: String? = nil
        
        public func setLabel(label: String){
            self.label = "[\(fromCamelCase(value: label))] "
        }
        
        public static func withMethodLabel(
            logger current: LoggerWrapper,
            label: String,
            call: Bool = true,
            divider: String? = " "
        ) -> LoggerWrapper{
            let logger = current.copy()
            let methodNameWithoutParameters = label.split(separator: "(").first
            let methodName = "\(methodNameWithoutParameters ?? "")"
            logger.label = "[method] [\(fromCamelCase(value: methodName))]\(divider ?? "")"
            if call {
                logger.debug("Call")
            }
            return logger
        }
        
        public static func withTypeLabel<T>(logger current: LoggerWrapper, type: T.Type) -> LoggerWrapper{
            let logger = current.copy()
            logger.typeName = "[type: \(fromCamelCase(value: "\(type)"))] "
            return logger
        }
        
        public static func withTypeLabel(logger current: LoggerWrapper, label: String) -> LoggerWrapper{
            let logger = current.copy()
            logger.typeName = "[type: \(label)] "
            return logger
        }
        
        @discardableResult
        public func withMethodLabel(label: String, call: Bool = true) -> LoggerWrapper {
            LoggerWrapper.withMethodLabel(logger: self, label: label, call: call)
        }
        
        public func withTypeLabel<T>(type: T.Type) -> LoggerWrapper {
            LoggerWrapper.withTypeLabel(logger: self, type: type)
        }
        
        public func withTypeLabel(label: String) -> LoggerWrapper {
            LoggerWrapper.withTypeLabel(logger: self, label: label)
        }
        

        public func completed(){
            self.debug("Completed")
            self.label = nil
        }
        
        public func failure(){
            self.debug("Failure")
            self.label = nil
        }
        
        
        public func debug<T: CustomDebugStringConvertible>(_ name: String, value: T?){
            self.debug("\(name): \(value?.debugDescription ?? "nil")")
        }
        
        public func info(_ messages: String...){
            let message: String = messages.reduce("") { $0 + $1 + " " }
            self.logger.debug("\(self.typeName ?? "")\((self.label ?? "") + message)")
        }
        
        public func console(_ messages: String...){
            let message: String = messages.reduce("") { $0 + $1 + " " }
            self.logger.debug("\(self.typeName ?? "")\((self.label ?? "") + message)")
        }
        
        #if DEBUG
        public func debug(_ message: String){
            self.logger.debug("\(self.typeName ?? "")\((self.label ?? "") + message)")
        }
        #else
        public func debug(_ message: String){}
        #endif
        
        public func error(_ message: String){
            self.logger.error("\(message)")
        }
    }
}
