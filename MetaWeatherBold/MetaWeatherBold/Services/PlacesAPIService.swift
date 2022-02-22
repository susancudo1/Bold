//
//  PlacesAPIService.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import Foundation
import Alamofire

class PlacesAPIService: PlacesAPIServiceProtocol {
    func getPlaces(query: String, onComplete: @escaping ([PlaceModel]?) -> Void) {
        let request = AF.request("https://www.metaweather.com/api/location/search/?query=\(query)")

        request.responseDecodable(of: [PlaceModel].self) { (response) in
            guard let places = response.value else {
                onComplete(nil)
                return
            }
            onComplete(places)
        }
    }

    func getDetail(woeid: Int, onComplete: @escaping (DetailModel?) -> Void) {
        let request = AF.request("https://www.metaweather.com/api/location/\(woeid)/")

        request.responseDecodable(of: DetailModel.self) { (response) in
            guard let detail = response.value else {
                onComplete(nil)
                return
            }
            onComplete(detail)
        }
    }
}
