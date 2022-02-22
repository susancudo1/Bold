//
//  DetailPresenter.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import Foundation

class DetailPresenter {

    private let placesUseCase: PlacesUseCaseProtocol

    init(placesUseCase: PlacesUseCaseProtocol) {
        self.placesUseCase = placesUseCase
    }

    func getDetail(woeid: Int, onComplete: @escaping (DetailModel?) -> Void) {
        self.placesUseCase.getDetail(woeid: woeid, onComplete: onComplete)
    }
}
