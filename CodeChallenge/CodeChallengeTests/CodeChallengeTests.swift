//
//  CodeChallengeTests.swift
//  CodeChallengeTests
//
//  Created by Emmanuel Casanas Cruz on 7/10/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
@testable import CodeChallenge

class CodeChallengeTests: XCTestCase {

    func testUserModel() {
        let model = User(name: "Barry Allen", currentJob: "Speedster", pictureUrl: "https://www.picture.com/barry", jobs: [])
        let viewModel = UserViewModel(user: model)
        
        XCTAssertEqual(viewModel.userName, model.name)
    }
    
    
    func testResponseAPI () {
        LibraryAPI.sharedInstance.getProfileInfo(Success: { (response) in
            XCTAssert(response.isKind(of: infoResponse.self))
        }) { (error) in

        }
    }
    
    func testLocalizableString() {
        let text =  "EmptyViewTitle".localize()
         XCTAssert(text == "Something went wrong.")
    }
    
    func testJsonJobException() {
        let dictionary = ["element": "empty"]
        let job = Job (dictionary: dictionary as Dictionary<String, AnyObject>)
        XCTAssert(job.company == "")
    }

    func testInfoResponseException() {
        let dictionary = ["jobs": "empty"]
        let response = infoResponse (dictionary: dictionary as Dictionary<String, AnyObject>)
        XCTAssert(response.name == "")
    }
    
    

}
