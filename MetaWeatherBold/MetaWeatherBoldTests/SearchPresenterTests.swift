//
//  SearchPresenterTests.swift
//  MetaWeatherBoldTests
//
//  Created by Javier Susa on 21/02/22.
//

import XCTest
@testable import MetaWeatherBold

class SearchPresenterTests: XCTestCase {

    let presenter = SearchPresenterFactory().createPresenter()

    func testGetPlacesSuccess() {
        let query = "bogot"

        var places: [PlaceModel]?
        let exp = self.expectation(description: "Waiting for blocking")
        self.presenter.getPlaces(query: query, onComplete: { placesModel in
            places = placesModel
            exp.fulfill()
        })
        self.waitForExpectations(timeout: 5)
        XCTAssertEqual(places?.first?.woeid, 368148)
    }

    func testGetPlacesEmpty() {
        let query = "bogota"

        var places: [PlaceModel]?
        let exp = self.expectation(description: "Waiting for blocking")
        self.presenter.getPlaces(query: query, onComplete: { placesModel in
            places = placesModel
            exp.fulfill()
        })
        self.waitForExpectations(timeout: 5)
        XCTAssertEqual(places?.first?.woeid, nil)
    }
}
