/*
 
 Project: SwiftUtilities
 File: CaseConvertable.swift
 Created by: Egor Boyko
 Date: 03.01.2022
 
 
 Status: #Complete | #Not decorated
 
 */


import Foundation

public protocol CaseConvertable: RawRepresentable, CaseIterable {
    static var caseDelimiter: String { get }
    static var isFirstLetterUp: Bool { get }
}

extension CaseConvertable {
    
    public static var isFirstLetterUp: Bool { false }
    
    public var name: String {
        let typeName = self.fromCamelCase(value: .init(describing: Self.self))
        let caseName = self.fromCamelCase(value: self.string)
        return typeName + Self.caseDelimiter + caseName
    }
    
    private var string: String {
        self.rawValue as! String
    }
    
//    func her(){
//        var lalue =
//
//
//    }
    
    private func fromCamelCase(value: String) -> String {
        var iteration: Int = 0
        var temp: String = ""
        for item in value {
            let current = String(item)
            let bool = item.uppercased() == current && temp != ""
            let start = Self.isFirstLetterUp ? current.uppercased() : current.lowercased()
            temp += bool ?
            Self.caseDelimiter + start :
            iteration == 0 ?
            start : current.lowercased()
            iteration += 1
        }
        return temp
    }
}
