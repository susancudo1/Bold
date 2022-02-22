//
//  DetailPresenterFactory.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import Foundation

class DetailPresenterFactory {
    func createPresenter() -> DetailPresenter {
        return DetailPresenter(placesUseCase: PlacesUseCase())
    }
}
