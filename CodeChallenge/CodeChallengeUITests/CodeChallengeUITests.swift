//
//  CodeChallengeUITests.swift
//  CodeChallengeUITests
//
//  Created by Emmanuel Casanas Cruz on 7/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
@testable import CodeChallenge

class CodeChallengeUITests: XCTestCase {

     let app = XCUIApplication()
    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        print(app.debugDescription)
    }
    
//    func testCollectionSize() {
//        let app = XCUIApplication()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            let elements = app.collectionViews.firstMatch.cells.count
//            XCTAssert(elements > 0)
//        }
//    }
    
    func testCollectionCell() {
        let firstChild = app.collectionViews.children(matching:.any).element(boundBy: 0)
        if firstChild.exists {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                firstChild.tap()
            }
        }
    }
    
    func testDetailView () {
        let expectation = XCTestExpectation(description: "tableViewLoaded")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        
        
        let tableView = app.tables.matching(identifier: "landingTableViewIdentifier")
        XCTAssertNotNil(tableView, "tableView must exist")
        
    }
    
    func testEmptyTableView(){
       
        let expectation = XCTestExpectation(description: "tableViewLoaded")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        // When

        
        let tableView = app.tables.matching(identifier: "landingTableViewIdentifier")
        let collectionView = tableView.collectionViews.matching(identifier: "appCollectionViewIdentifier")
       collectionView.element.tap()
        
        let button = app.buttons["dismissButton"]
        button.tap()
    
    }
    
    
    override func tearDown() {
        print("Teardown")
    }

}
