/*
 
 Project: SwiftUtilities
 File: Array+Methods+Replace+Tests.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 */

import XCTest
import OSLog
@testable import SwiftUtilities

let logger = Logger()

final class ArrayMethodReplaceTests: XCTestCase {
    
    @MainActor func testBlankInsert() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        let insert: [Int] = []
        testableArray.replace(contentsOf: insert, from: 1, to: 3)
        XCTAssert(testableArray.count == 2)
        XCTAssert(!testableArray.contains(2))
        XCTAssert(!testableArray.contains(3))
        XCTAssert(!testableArray.contains(4))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(5))
    }
    
    @MainActor func testLargeInsert() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        let insert: [Int] = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
        testableArray.replace(contentsOf: insert, from: 1, to: 3)
        XCTAssert(testableArray.count == 13)
        XCTAssert(!testableArray.contains(2))
        XCTAssert(!testableArray.contains(3))
        XCTAssert(!testableArray.contains(4))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(5))
        for item in insert {
            XCTAssert(testableArray.contains(item))
        }
    }
    
    @MainActor func testInsertingOneElement() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        let insert: [Int] = [11]
        testableArray.replace(contentsOf: insert, from: 1, to: 3)
        XCTAssert(testableArray.count == 3)
        XCTAssert(!testableArray.contains(2))
        XCTAssert(!testableArray.contains(3))
        XCTAssert(!testableArray.contains(4))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(5))
        XCTAssert(testableArray.contains(11))
    }
    
    @MainActor func testIncorrectParametrFrom() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        let insert: [Int] = [11]
        testableArray.replace(contentsOf: insert, from: 500, to: 3)
        XCTAssert(testableArray.count == 4)
        XCTAssert(!testableArray.contains(3))
        XCTAssert(!testableArray.contains(4))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(2))
        XCTAssert(testableArray.contains(5))
        XCTAssert(testableArray.contains(11))
    }
    
    @MainActor func testIncorrectParametrTo() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        let insert: [Int] = [11]
        testableArray.replace(contentsOf: insert, from: 1, to: 500)
        XCTAssert(testableArray.count == 2)
        XCTAssert(!testableArray.contains(2))
        XCTAssert(!testableArray.contains(3))
        XCTAssert(!testableArray.contains(4))
        XCTAssert(!testableArray.contains(5))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(11))
    }
    
    
    @MainActor func testInsertingIntoEmptyArray() throws {
        var testableArray: [Int] = []
        let insert: [Int] = [11, 12]
        testableArray.replace(contentsOf: insert)
        XCTAssert(testableArray.count == 2)
        XCTAssert(testableArray.contains(12))
        XCTAssert(testableArray.contains(11))
    }
    
    
    @MainActor func testInsertingIntoArraywithOneElement() throws {
        var testableArray: [Int] = [15]
        let insert: [Int] = [11, 12]
        testableArray.replace(contentsOf: insert)
        XCTAssert(testableArray.count == 2)
        XCTAssert(testableArray.contains(12))
        XCTAssert(testableArray.contains(11))
    }
    
    @MainActor func testReplacing() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        var insert: [Int] = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
        testableArray.replace(contentsOf: insert, of: 2)
        XCTAssert(testableArray.count == 13)
        XCTAssert(!testableArray.contains(3))
        XCTAssert(!testableArray.contains(4))
        XCTAssert(!testableArray.contains(5))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(2))
        for item in insert {
            XCTAssert(testableArray.contains(item))
        }
        
        testableArray = [1,2,3,4,5,6,7]
        let count = testableArray.count
        insert = [11,12,13]
        testableArray.replace(contentsOf: insert, of: 2)
        XCTAssert(testableArray.count == count)
        XCTAssert(!testableArray.contains(3))
        XCTAssert(!testableArray.contains(4))
        XCTAssert(!testableArray.contains(5))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(2))
        XCTAssert(testableArray.contains(6))
        XCTAssert(testableArray.contains(7))
        for item in insert {
            XCTAssert(testableArray.contains(item))
        }
    }
    
    @MainActor func testReplacingOneElement() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        let insert: [Int] = [11]
        testableArray.replace(contentsOf: insert, of: 2)
        XCTAssert(testableArray.count == 5)
        XCTAssert(!testableArray.contains(3))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(2))
        XCTAssert(testableArray.contains(11))
        XCTAssert(testableArray.contains(4))
        XCTAssert(testableArray.contains(5))
    }
    
    
    @MainActor func testReplacingEmptyArray() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        let insert: [Int] = []
        testableArray.replace(contentsOf: insert, of: 2)
        XCTAssert(testableArray.count == 5)
        for item in testableArray {
            XCTAssert(testableArray.contains(item))
        }
    }
    
    @MainActor func testReplacingIncorrectParametrOf() throws {
        var testableArray: [Int] = [1,2,3,4,5]
        let insert: [Int] = [11,12,13]
        
        testableArray.replace(contentsOf: insert, of: 500)
        logger.debug("\(testableArray)")
        XCTAssert(testableArray.count == 7)
        XCTAssert(!testableArray.contains(5))
        XCTAssert(testableArray.contains(1))
        XCTAssert(testableArray.contains(2))
        XCTAssert(testableArray.contains(3))
        XCTAssert(testableArray.contains(4))
        for item in insert {
            XCTAssert(testableArray.contains(item))
        }
    }
    
}
