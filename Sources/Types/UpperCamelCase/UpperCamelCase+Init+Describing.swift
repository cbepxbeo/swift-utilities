/*
 
 Project: SwiftUtilities
 File: UpperCamelCase+Init+Describing.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 Status: #Complete | #Not decorated
 
 */

extension UpperCamelCase {
    public init<Subject>(describing instance: Subject){
        self.init(stringLiteral: .init(describing: instance))
    }
}
