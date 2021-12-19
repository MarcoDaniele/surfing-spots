//
//  MockWeatherService.swift
//  Surfing SpotsTests
//
//  Created by Marco Daniele on 19/12/21.
//

import Foundation
@testable import Surfing_Spots
import UIKit.UIImage

final class MockWeatherService: WeatherService {
    var cities: [City] = []
    var randomCity: City?
    var weather: Weather = Weather(temperature: 0)
    
    
    func fetchCities() async throws -> [City] {
        return cities
    }
    
    func fetchWeather(for city: City) async throws -> Weather {
        randomCity = city
        
        return weather
    }
}
