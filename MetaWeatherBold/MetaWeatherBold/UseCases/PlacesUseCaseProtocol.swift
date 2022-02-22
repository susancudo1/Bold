//
//  PlacesUseCaseProtocol.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import Foundation

protocol PlacesUseCaseProtocol {
    func getPlaces(query: String, onComplete: @escaping ([PlaceModel]?) -> Void)
    func getDetail(woeid: Int, onComplete: @escaping (DetailModel?) -> Void)
}
