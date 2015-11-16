//
//  MASHTests.swift
//  MASHTests
//
//  Created by Amira Hailemariam on 11/5/15.
//  Copyright © 2015 Amira Hailemariam. All rights reserved.
//

import XCTest
@testable import MASH

class MASHTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testResetGameStateModel() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewControllerTests : ViewController = storyBoard.instantiateViewControllerWithIdentifier("GameView") as! ViewController
        viewControllerTests.loadView()
        viewControllerTests.elements.removeAll()
        viewControllerTests.categories.removeAll()
        viewControllerTests.resetGameState()
        XCTAssertNotNil(storyBoard)
        XCTAssertFalse(viewControllerTests.elements.isEmpty)
        XCTAssertFalse(viewControllerTests.categories.isEmpty)
    }
    
}
