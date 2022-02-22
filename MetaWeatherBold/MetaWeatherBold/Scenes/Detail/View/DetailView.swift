//
//  DetailView.swift
//  MetaWeatherBold
//
//  Created by Javier Susa on 21/02/22.
//

import SwiftUI

struct DetailView: View {
    private var presenter: DetailPresenter
    private var woeid: Int
    @State private var detailPlace: DetailModel?
    init(woeid: Int) {
        self.woeid = woeid
        self.presenter = DetailPresenterFactory().createPresenter()
    }
    var body: some View {

        ScrollView {
            if self.detailPlace != nil {
                Text(self.detailPlace?.title ?? "")
                    .font(.system(.title))
                    .bold()
                    .padding()
                Text(String(format: "%.1f", self.detailPlace?.consolidatedWeather.first?.theTemp ?? 0.0) + "º")
                    .font(.system(.largeTitle))
                    .bold()
                Text(self.detailPlace?.consolidatedWeather.first?.weatherStateName ?? "")
                    .font(.system(.body))
                    .bold()
                    .padding()
                Text("Max.: " + String(format: "%.1f", self.detailPlace?.consolidatedWeather.first?.minTemp ?? 0.0) + "º Min.: " + String(format: "%.1f", self.detailPlace?.consolidatedWeather.first?.maxTemp ?? 0.0) + "º")
                    .padding(.bottom)
                ForEach(self.detailPlace?.consolidatedWeather ?? [], id: \.id) { consolidatedWeather in
                    HStack {
                        Text(consolidatedWeather.applicableDate)
                        Spacer()

                        AsyncImage(url: URL(string: "https://www.metaweather.com/static/img/weather/png/64/\(consolidatedWeather.weatherStateAbbr).png"))
                        Spacer()

                        Text("Min. " + String(format: "%.1f", consolidatedWeather.minTemp) + "º")
                        Spacer()

                        Text(String(format: "%.1f", consolidatedWeather.maxTemp) + "º Max.")
                    }.padding()
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            self.presenter.getDetail(woeid: self.woeid, onComplete: { detail in
                self.detailPlace = detail
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(woeid: 368148)
    }
}
