//
//  MASHTests.swift
//  MASHTests
//
//  Created by Amira Hailemariam on 11/5/15.
//  Copyright © 2015 Amira Hailemariam. All rights reserved.
//

import XCTest
@testable import MASH

class ViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChangeLabelAcceptsAndUsesParameter() {
        let theViewControllerUnderTest: ViewController = ViewController()
        theViewControllerUnderTest.changeLabels("Languages")
        XCTAssertEqual(theViewControllerUnderTest.lInputOne.text, "Languages")
    }
    
}
