//
//  NetworkingTests.swift
//  ArcTouchCodeChallengeTests
//
//  Created by Onesight on 22/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import XCTest
import ArcTouchCodeChallenge
import RealmSwift

class NetworkingTests: XCTestCase {

    override func setUp() {
        super.setUp()

         Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetGenresList() {
        let ex = expectation(description: "Expecting a Genres JSON data not nil")

        APIClient.shared.getGenresList { (result, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(result)
            ex.fulfill()
        }

        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }

    func testgetMoviesList() {
        let ex = expectation(description: "Expecting a Movies JSON data not nil")

        APIClient.shared.getMoviesList(page: 1) { (result, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(result)
            ex.fulfill()
        }

        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
}
