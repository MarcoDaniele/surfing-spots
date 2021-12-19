//
//  WeatherScreen.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import SwiftUI

struct WeatherScreen: View {
    @StateObject var viewModel = WeatherViewModelImpl(service: WeatherServiceImpl())
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        List([City](viewModel.weatherInfo.keys)) { city in
            CityCell(city: city, weather: viewModel.weatherInfo[city]!)
                .listRowSeparator(.hidden)
                .listRowInsets(.none)
        }
        .listStyle(.plain)
        .navigationTitle("Surfing Spots")
        .onAppear(perform: {
            Task {
                await viewModel.getCities()
            }
        })
        .onReceive(timer) { _ in
            Task {
                await viewModel.getWeatherUpdates()
            }
        }
    }
}

struct WeatherScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherScreen()
        }
    }
}
