/*

Project: SwiftUtilities
File: FromCamelCase.swift
Created by: Egor Boyko
Date: 02.03.2021

*/


public func fromCamelCase(value: String, separator: String = "-") -> String {
    var iteration: Int = 0
    var temp: String = ""
    for item in value {
        let current = String(item)
        let bool = item.uppercased() == current && temp != ""
        let start = current.lowercased()
        temp += bool ?
        separator + start :
        iteration == 0 ?
        start : current.lowercased()
        iteration += 1
    }
    return temp
}
