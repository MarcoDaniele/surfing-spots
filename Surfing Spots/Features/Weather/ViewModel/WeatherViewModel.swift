//
//  WeatherViewModel.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import Foundation

protocol WeatherViewModel: ObservableObject {
    func getCities() async
    func getWeatherUpdates() async
}

@MainActor
class WeatherViewModelImpl: WeatherViewModel {
    @Published var weatherInfo: [City: Weather] = [:]
    
    private let service: WeatherService
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func getCities() async {
        do {
            let cities = try await service.fetchCities()
            let weatherInfo = cities.map({_ in Weather(temperature: Int.random(in: 15...50))})
            
            self.weatherInfo = cities.enumerated().reduce(into: [City: Weather](), { (acc, city) in
                acc[city.element] = weatherInfo[city.offset]})
        }
        catch {
            print(error)
        }
    }
    
    func getWeatherUpdates() async {
        if let city = weatherInfo.keys.randomElement() {
            do {
                let newWeatherInfo = try await service.fetchWeather(for: city)
                
                weatherInfo[city] = newWeatherInfo
            }
            catch {
                print(error)
            }
        }
    }
}
