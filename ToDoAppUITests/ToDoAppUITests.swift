//
//  ToDoAppUITests.swift
//  ToDoAppUITests
//
//  Created by Daniyar Erkinov on 8/27/19.
//  Copyright © 2019 danchopon.com. All rights reserved.
//

import XCTest

class ToDoAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments.append("--UITesting")
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.isOnMainView)
        
        app.navigationBars["ToDoApp.TaskListView"].buttons["Add"].tap()
        
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Foo")
        
        app.textFields["Description"].tap()
        app.textFields["Description"].typeText("Bar")
        
        app.textFields["Location"].tap()
        app.textFields["Location"].typeText("Baz")
        
        app.textFields["Date"].tap()
        app.textFields["Date"].typeText("01.01.19")
        
        app.textFields["Address"].tap()
        app.textFields["Address"].typeText("Уфа")
        
        XCTAssertFalse(app.isOnMainView)
   
        app.buttons["Save"].tap()
    }
    
    func testWhenCellIsSwipedLeftDoneButtonAppeared() {
        XCTAssertTrue(app.isOnMainView)
        
        app.navigationBars["ToDoApp.TaskListView"].buttons["Add"].tap()
        
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Hello")
        
        app.textFields["Description"].tap()
        app.textFields["Description"].typeText("World")
        
        app.textFields["Location"].tap()
        app.textFields["Location"].typeText("Blah Blah Blah")
        
        app.textFields["Date"].tap()
        app.textFields["Date"].typeText("01.01.19")
        
        app.textFields["Address"].tap()
        app.textFields["Address"].typeText("Бишкек")
        
        XCTAssertFalse(app.isOnMainView)
        
        app.buttons["Save"].tap()
        
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Done"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "date").label, "")
    }

}

extension XCUIApplication {
    var isOnMainView: Bool {
        return otherElements["mainView"].exists
    }
}
