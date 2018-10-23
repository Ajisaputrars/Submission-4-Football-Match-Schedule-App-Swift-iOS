//
//  SwiftKADE2Tests.swift
//  SwiftKADE2Tests
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import XCTest
@testable import SwiftKADE

class SwiftKADETests: XCTestCase {
    
    private var eventService: EventService!
    private var eventPresenter: EventPresenter!
    private var mainController: MainController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.eventService = EventService()
        self.eventPresenter = EventPresenter()
        self.mainController = MainController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEventServiceWithLastEventUrl(){
        eventService.getEvents(url: LAST_EVENT_URL) { (events) in
            XCTAssertEqual(events.count, 15)
            
        }
    }
    
    func testEventServiceWithNextEventUrl(){
        eventService.getEvents(url: NEXT_EVENT_URL) { (events) in
            XCTAssertEqual(events.count, 15)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
