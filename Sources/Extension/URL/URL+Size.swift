/*
 
 Project: SwiftUtilities
 File: URL+Size.swift
 Created by: Egor Boyko
 Date: 23.09.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension URL {
    public struct Size: CustomStringConvertible {
        init(_ format: String, _ uInt64: UInt64) {
            self.format = format
            self.uInt64 = uInt64
        }
        
        init(size: UInt64){
            let factor: UInt64 = 1024
            let format: String = switch size {
            case .min..<factor:
                "%lu byte"
            case factor..<factor * factor:
                "%.1f kb"
            case (factor * factor)..<(factor * factor * factor):
                "%.1f mb"
            default:
                "%.1f gb"
            }
            self.init(format, size)
        }
        
        let format: String
        let uInt64: UInt64
        public var description: String {
            .init(format: self.format, self.uInt64)
        }
    }
}
