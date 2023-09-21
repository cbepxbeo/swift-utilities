/*
 
 Project: SwiftUtilities
 File: UpperCamelCaseTests.swift
 Created by: Egor Boyko
 Date: 21.09.2023
 
 */

import XCTest
@testable import SwiftUtilities

final class UpperCamelCaseTests: XCTestCase {
    
    func testInputEmptyString() throws {
        let testTaker: UpperCamelCase = ""
        XCTAssert(testTaker.values.isEmpty)
        XCTAssert(testTaker.rawValue.isEmpty)
    }
    
    func testInputOnlySpaces() throws {
        let testTaker: UpperCamelCase = "     "
        XCTAssert(testTaker.values.isEmpty)
        XCTAssert(testTaker.rawValue.isEmpty)
    }
    
    func testInputUpperCamelCaseString() throws {
        let input: String = "ExampleCamelCaseString"
        let testTaker: UpperCamelCase = .init(stringLiteral: input)
        XCTAssert(testTaker.rawValue == input)
    }
    
    func testInputStringWithSpaces() throws {
        let input: String = "example camel case string"
        let output: String = "ExampleCamelCaseString"
        let testTaker: UpperCamelCase = .init(stringLiteral: input)
        XCTAssert(testTaker.rawValue == output)
    }
    
    func testInputStringWithSpacesAndCamelCaseString() throws {
        let input: String = "example camelCase string"
        let output: String = "ExampleCamelCaseString"
        let testTaker: UpperCamelCase = .init(stringLiteral: input)
        XCTAssert(testTaker.rawValue == output)
    }
    
    func testInputСharacter() throws {
        let input: String = "a"
        let output: String = input.uppercased()
        let testTaker: UpperCamelCase = .init(stringLiteral: input)
        XCTAssert(testTaker.rawValue == output)
    }
    
    func testInputСharacterWithSpaces() throws {
        let input: String = "a"
        let output: String = input.uppercased()
        let testTaker: UpperCamelCase = .init(stringLiteral: "   \(input)    ")
        XCTAssert(testTaker.rawValue == output)
    }
    
    func testOutputLowercased() throws {
        let separator: String = "!"
        let input: String = "ExampleCamelCaseString"
        let output: String = "example\(separator)camel\(separator)case\(separator)string"
        let testTaker: UpperCamelCase = .init(stringLiteral: input)
        XCTAssert(testTaker.transform(separator: separator, option: .lower) == output)
    }
    
    func testOutputUppercased() throws {
        let separator: String = "!"
        let input: String = "ExampleCamelCaseString"
        let output: String = "EXAMPLE\(separator)CAMEL\(separator)CASE\(separator)STRING"
        let testTaker: UpperCamelCase = .init(stringLiteral: input)
        XCTAssert(testTaker.transform(separator: separator, option: .upper) == output)
    }
    
    
    func testOperatorPlus() throws {
        
        let first: String = "FirstUpperCamelCaseValue"
        let second: String = "FirstUpperCamelCaseValue"
        let upperCamelCase1: UpperCamelCase = .init(stringLiteral: first)
        let upperCamelCase2: UpperCamelCase = .init(stringLiteral: second)
        
        let a = upperCamelCase1 + upperCamelCase2
        XCTAssert(a.rawValue == "\(first)\(second)")
        
        let b = upperCamelCase2 + upperCamelCase1
        XCTAssert(b.rawValue == "\(second)\(first)")
    }
    
    
    func testOperatorPlusWithString() throws {
        
        let input: String = "UpperCamelCaseValue"
        let upperCamelCase: UpperCamelCase = .init(stringLiteral: input)
        let string: String = "StringValue"

        let a = string + upperCamelCase
        XCTAssert(a == "\(string)\(input)")
        
        let b = upperCamelCase + string
        XCTAssert(b.rawValue == "\(input)\(string)")
    }
}
