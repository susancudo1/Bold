//
//  SearchPresenter.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import Foundation

class SearchPresenter {

    private let placesUseCase: PlacesUseCaseProtocol

    init(placesUseCase: PlacesUseCaseProtocol) {
        self.placesUseCase = placesUseCase
    }

    func getPlaces(query: String, onComplete: @escaping ([PlaceModel]?) -> Void) {
        self.placesUseCase.getPlaces(query: query, onComplete: onComplete)
    }
}
