/*

Project: SwiftUtilities
File: EnumConvertable.swift
Created by: Egor Boyko
Date: 03.01.2022


Status: #Complete | #Not decorated

*/

import Foundation


public protocol EnumConvertable: CaseIterable {}

extension EnumConvertable {
    public static func converting<Output: CaseIterable>(_ value: Self) -> Output? {
        var result: Output? = nil
        Output.allCases.forEach {
            guard let input = String(reflecting: value)
                .split(separator: ".").last,
                  let output = String(reflecting: $0)
                .split(separator: ".").last else {
                return
            }
            if input == output {
                result = $0
            }
        }
        return result
    }
    
    public static func forceConverting<Output: EnumConvertable>(_ value: Self) -> Output {
        guard let result: Output = self.converting(value) else {
            fatalError("no intersections")
        }
        return result
    }
}
