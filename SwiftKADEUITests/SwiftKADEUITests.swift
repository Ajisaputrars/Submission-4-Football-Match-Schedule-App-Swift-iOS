//
//  SwiftKADE2UITests.swift
//  SwiftKADE2UITests
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import XCTest

class SwiftKADEUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFromMainViewToDetailView() {
        let app = XCUIApplication()
        let mainTable = app.tables["mainTable"]
        mainTable.cells.element(boundBy: 2).tap()
        
        let backButton = app.navigationBars["Detail Match"].buttons["Back"]
        backButton.tap()
    }
    
    func testSegmentedControl(){
        let app = XCUIApplication()
        let lastMatchButton = app/*@START_MENU_TOKEN@*/.buttons["Last Match"]/*[[".segmentedControls[\"mainSegmentedControl\"].buttons[\"Last Match\"]",".buttons[\"Last Match\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lastMatchButton.tap()
        sleep(1)
        
        let nextMatchButton = app/*@START_MENU_TOKEN@*/.buttons["Next Match"]/*[[".segmentedControls[\"mainSegmentedControl\"].buttons[\"Next Match\"]",".buttons[\"Next Match\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nextMatchButton.tap()
        sleep(1)
        
        let favoritesButton = app/*@START_MENU_TOKEN@*/.buttons["Favorites"]/*[[".segmentedControls[\"mainSegmentedControl\"].buttons[\"Favorites\"]",".buttons[\"Favorites\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        favoritesButton.tap()
        sleep(1)
        
        nextMatchButton.tap()
        sleep(1)
        favoritesButton.tap()
        sleep(1)
        lastMatchButton.tap()
        sleep(1)
    }
    
    func testLastMatchSection(){
        let app = XCUIApplication()
        let mainTable = app.tables["mainTable"]
        mainTable.cells.element(boundBy: 0).tap()
        
        let backButton = app.navigationBars["Detail Match"].buttons["Back"]
        backButton.tap()
        
        mainTable.cells.element(boundBy: 1).tap()
        backButton.tap()
        
        mainTable.cells.element(boundBy: 2).tap()
        backButton.tap()
        
        mainTable.cells.element(boundBy: 3).tap()
        backButton.tap()
    }
    
    func testNextMatchSection(){
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Next Match"]/*[[".segmentedControls[\"mainSegmentedControl\"].buttons[\"Next Match\"]",".buttons[\"Next Match\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(2)

        let app = XCUIApplication()
        let mainTable = app.tables["mainTable"]
        mainTable.cells.element(boundBy: 0).tap()
        sleep(1)
        
        let backButton = app.navigationBars["Detail Match"].buttons["Back"]
        backButton.tap()
        
        mainTable.cells.element(boundBy: 1).tap()
        sleep(1)
        backButton.tap()
    }
    
    func testSaveAndDeleteFromFavorite(){
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Favorites"]/*[[".segmentedControls[\"mainSegmentedControl\"].buttons[\"Favorites\"]",".buttons[\"Favorites\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let app = XCUIApplication()
        sleep(1)
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Next Match"]/*[[".segmentedControls[\"mainSegmentedControl\"].buttons[\"Next Match\"]",".buttons[\"Next Match\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(2)
        
        let mainTable = app.tables["mainTable"]
        mainTable.cells.element(boundBy: 0).tap()
        sleep(1)
        
        let detailMatchNavigationBar = app.navigationBars["Detail Match"]
        let starunsavedButton = detailMatchNavigationBar.buttons["StarUnsaved"]
        starunsavedButton.tap()
        sleep(1)
        
        let backButton = detailMatchNavigationBar.buttons["Back"]
        backButton.tap()
        
        let favoritesButton = app/*@START_MENU_TOKEN@*/.buttons["Favorites"]/*[[".segmentedControls[\"mainSegmentedControl\"].buttons[\"Favorites\"]",".buttons[\"Favorites\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        favoritesButton.tap()
        sleep(1)
        
        app/*@START_MENU_TOKEN@*/.buttons["Last Match"]/*[[".segmentedControls[\"mainSegmentedControl\"].buttons[\"Last Match\"]",".buttons[\"Last Match\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(1)
        
        mainTable.cells.element(boundBy: 0).tap()
        sleep(1)
        
        starunsavedButton.tap()
        sleep(1)
        
        backButton.tap()
        favoritesButton.tap()
        mainTable.cells.element(boundBy: 0).tap()
        sleep(1)
        
        detailMatchNavigationBar.buttons["StarSaved"].tap()
        sleep(1)
        backButton.tap()
        sleep(1)
        
        mainTable.cells.element(boundBy: 0).tap()
        sleep(1)
        detailMatchNavigationBar.buttons["StarSaved"].tap()
        sleep(1)
        backButton.tap()
        sleep(1)
    }
}
