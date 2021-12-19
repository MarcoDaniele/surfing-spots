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
        let result: City.CitiesResponse = try await URLSession.shared.request(Routes.cities.request)

        let images = result.cities.map({
            getImage(for: $0.name)
        })

        return result.cities.enumerated().map({ city in
            City(name: city.element.name, image: images[city.offset])
        })
    }
    
    func fetchWeather(for city: City) async throws -> Weather {
        let string = try String(contentsOf: Routes.randomNumber.request.url!)
        
        if let firstWord = string.split(separator: " ").first,
           let number = Int(firstWord) {
            
            return Weather(temperature: number%30 + 15)
        }
        
        return Weather(temperature: -1)
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

enum Routes {
    case cities
    case randomNumber
}

extension Routes: Endpoint {
    var base: String {
        switch self {
        case .cities: return "https://run.mocky.io"
        case .randomNumber: return "http://numbersapi.com"
        }
    }
    
    var path: String {
        switch self {
        case .cities: return "/v3/652ceb94-b24e-432b-b6c5-8a54bc1226b6"
        case .randomNumber: return "/random/math"
        }
    }
}
