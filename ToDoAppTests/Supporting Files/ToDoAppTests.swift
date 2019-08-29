//
//  ToDoAppTests.swift
//  ToDoAppTests
//
//  Created by Daniyar Erkinov on 8/27/19.
//  Copyright © 2019 danchopon.com. All rights reserved.
//

import XCTest
@testable import ToDoApp

class ToDoAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
    }

    func testInitialViewControllerIsTaskViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers.first as! TaskListViewController
        
        XCTAssertTrue(rootViewController is TaskListViewController)
    }
    
}
