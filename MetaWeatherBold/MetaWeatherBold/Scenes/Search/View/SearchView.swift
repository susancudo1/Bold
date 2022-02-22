//
//  SearchView.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import SwiftUI

struct SearchView: View {
    private var presenter: SearchPresenter
    @State private var places: [PlaceModel] = []
    @State private var searchText = ""
    @State private var place: PlaceModel?

    init() {
        self.presenter = SearchPresenterFactory().createPresenter()
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.woeid) { place in
                    NavigationLink(destination: DetailView(woeid: place.woeid)) {
                        Text("\(place.title) - \(place.location_type)")
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("MetaWeather")
            .disableAutocorrection(true)
        }.navigationViewStyle(.stack)
    }

    var searchResults: [PlaceModel] {
        if searchText.isEmpty {
            return []
        } else {
            self.presenter.getPlaces(query: searchText, onComplete: { placesModel in
                guard let placesModel = placesModel else {
                    return
                }
                self.places = placesModel
            })
            return self.places
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
