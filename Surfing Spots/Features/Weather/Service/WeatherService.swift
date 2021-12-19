//
//  WeatherService.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import Foundation
import UIKit

protocol WeatherService {
    func fetchCities() async throws -> [City]
    func fetchWeather(for: City) async throws -> Weather
}

class WeatherServiceImpl: WeatherService {
    func fetchCities() async throws -> [City] {
        //dummy data
        let cityNames = ["Riccione", "Miami", "Los Angeles"]
        
        return cityNames.map({City(name: $0, image: getImage(for: $0))})
    }
    
    func fetchWeather(for city: City) async throws -> Weather {
        //dummy data
        return Weather(temperature: Int.random(in: 15...45))
    }
    
    private func getImage(for city: String) -> UIImage {
        //dummy data
        return [
            UIImage(named: "city1")!,
            UIImage(named: "city2")!,
            UIImage(named: "city3")!
        ].randomElement()!
    }
}
