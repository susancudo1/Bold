//
//  SearchPresenterFactory.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import Foundation

class SearchPresenterFactory {
    func createPresenter() -> SearchPresenter {
        return SearchPresenter(placesUseCase: PlacesUseCase())
    }
}
