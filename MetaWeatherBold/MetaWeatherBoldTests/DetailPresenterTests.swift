//
//  DetailPresenterTests.swift
//  MetaWeatherBoldTests
//
//  Created by Javier Susa on 21/02/22.
//

import XCTest
@testable import MetaWeatherBold

class DetailPresenterTests: XCTestCase {

    let presenter = DetailPresenterFactory().createPresenter()

    func testGetPlacesSuccess() {
        let woeid = 368148

        var detail: DetailModel?
        let exp = self.expectation(description: "Waiting for blocking")
        self.presenter.getDetail(woeid: woeid, onComplete: { detailModel in
            detail = detailModel
            exp.fulfill()
        })
        self.waitForExpectations(timeout: 5)
        XCTAssertEqual(detail?.title, "Bogotá")
    }

    func testGetPlacesEmpty() {
        let woeid = 3681489

        var detail: DetailModel?
        let exp = self.expectation(description: "Waiting for blocking")
        self.presenter.getDetail(woeid: woeid, onComplete: { detailModel in
            detail = detailModel
            exp.fulfill()
        })
        self.waitForExpectations(timeout: 5)
        XCTAssertEqual(detail?.title, nil)
    }
}
