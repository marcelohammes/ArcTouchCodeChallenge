//
//  ArcTouchCodeChallengeUITests.swift
//  ArcTouchCodeChallengeUITests
//
//  Created by Onesight on 19/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import XCTest

class ArcTouchCodeChallengeUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testOpenMovieDetails() {

        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()

        XCTAssertTrue(app.otherElements["MOVIE_DETAILS_IDENTIFIER"].exists)
    }

}
