//
//  PlacesUseCase.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import Foundation

class PlacesUseCase: PlacesUseCaseProtocol {

    private var placesApiService: PlacesAPIServiceProtocol

    init(placesApiService: PlacesAPIServiceProtocol) {
        self.placesApiService = placesApiService
    }

    convenience init() {
        self.init(placesApiService: PlacesAPIService())
    }

    func getPlaces(query: String, onComplete: @escaping ([PlaceModel]?) -> Void) {
        self.placesApiService.getPlaces(query: query, onComplete: onComplete)
    }

    func getDetail(woeid: Int, onComplete: @escaping (DetailModel?) -> Void) {
        self.placesApiService.getDetail(woeid: woeid, onComplete: onComplete)
    }
}
