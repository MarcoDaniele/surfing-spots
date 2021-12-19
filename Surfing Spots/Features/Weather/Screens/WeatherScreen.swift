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
        List(sortWeatherInfo(viewModel.weatherInfo)) { city in
            CityCell(city: city, weather: viewModel.weatherInfo[city]!)
                .listRowSeparator(.hidden)
                .listRowInsets(.none)
        }
        .listStyle(.plain)
        .navigationTitle("Surfing Spots")
        .animation(.default, value: viewModel.weatherInfo)
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
    
    func sortWeatherInfo(_ weatherInfo: [City: Weather]) -> [City] {
        return weatherInfo.keys.sorted(by: {
            weatherInfo[$0]!.temperature > weatherInfo[$1]!.temperature
        })
    }
}

struct WeatherScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherScreen()
        }
    }
}
