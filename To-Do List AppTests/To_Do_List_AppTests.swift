//
//  To_Do_List_AppTests.swift
//  To-Do List AppTests
//
//  Created by Maaz Uddin on 2/23/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import XCTest
@testable import To_Do_List_App

class To_Do_List_AppTests: XCTestCase {
    
    var vc : FirstViewController!
    
    override func setUp() {
        super.setUp()
        
        vc = FirstViewController()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            
        }
    }
    
    func testThatTaskModelExists() {
        XCTAssertNotNil(vc.tasks, "Tasks should not be nil")
    }
    
    func testThatIsWithin24HoursWorks() {
        let anHourAgo = NSDate(timeIntervalSinceNow: -3600)
        XCTAssertTrue(vc.isWithin24Hours(anHourAgo), "YOOOO!! WASSUP")
    }
    
}
