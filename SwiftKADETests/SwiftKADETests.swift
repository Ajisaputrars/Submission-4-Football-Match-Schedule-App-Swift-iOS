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
    private var teamService: TeamService!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.eventService = EventService()
        self.eventPresenter = EventPresenter()
        self.teamService = TeamService()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEventServiceWithLastEventUrl(){
        let anExpectation = expectation(description: "LastMatch")
        eventService.getEvents(url: LAST_EVENT_URL) { (events) in
            XCTAssertEqual(events.count, 15)
            anExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testEventServiceWithNextEventUrl(){
        let anExpectation = expectation(description: "NextMatch")
        eventService.getEvents(url: NEXT_EVENT_URL) { (events) in
            XCTAssertEqual(events.count, 15)
            anExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testTeamService(){
        let url = "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=133604"
        let resultUrl = "https://www.thesportsdb.com/images/media/team/badge/a1af2i1557005128.png"
        
        let anExpectation = expectation(description: "Team")
        teamService.getTeamBadge(url: url) { (team) in
            XCTAssertEqual(team[0].strTeamBadge, resultUrl)
            XCTAssertEqual(team.count, 1)
            anExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testEventPresenterInController(){
        class mockClass: EventProtocol{
            var isStartLoadingCalled = false
            var isStopLoadingCalled = false
            var isSetEmptyEventsCalled = false
            var isGetEventsCalled = false
            
            var presenter: EventPresenter!
            
            init() {
                presenter = EventPresenter()
                presenter.getEvents(view: self, service: EventService(), url: LAST_EVENT_URL)
            }
            
            func startLoading() {
                isStartLoadingCalled = true
            }
            
            func stopLoading() {
                isStopLoadingCalled = true
                XCTAssertTrue(self.isStopLoadingCalled)
            }
            
            func setEmptyEvents() {
                isSetEmptyEventsCalled = true
            }
            
            func getEvents(events: [Event]) {
                isGetEventsCalled = true
                XCTAssertTrue(self.isGetEventsCalled)
                XCTAssertEqual(events.count, 15)
            }
        }
        
        let mockTest = mockClass()
        XCTAssertTrue(mockTest.isStartLoadingCalled)
        sleep(3)
    }
    
    func testTeamPresenterInController() {
        class MockClass: TeamBadgeProtocol {
            let url = "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=133604"
            
            let presenter = TeamPresenter()
            
            var setHomeBadgeIsCalled = false
            var setAwayBadgeIsCalled = false
            var isTrue = false
            
            init() {
                presenter.getTeams(url: self.url, view: self, service: TeamService(), isHome: true)
                presenter.getTeams(url: self.url, view: self, service: TeamService(), isHome: false)
            }
            
            func setHomeBadge(teams: [Team]) {
                setHomeBadgeIsCalled = true
                XCTAssertEqual(teams.count, 1)
                XCTAssertTrue(setHomeBadgeIsCalled)
            }
            
            func setAwayBadge(teams: [Team]) {
                setAwayBadgeIsCalled = true
                XCTAssertEqual(teams.count, 1)
                XCTAssertTrue(setAwayBadgeIsCalled)
            }
        }
        
        _ = MockClass()
        sleep(3)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
