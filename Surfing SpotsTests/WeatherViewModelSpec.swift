//
//  WeatherViewModelSpec.swift
//  Surfing SpotsTests
//
//  Created by Marco Daniele on 19/12/21.
//

import XCTest
@testable import Surfing_Spots

class WeatherViewModelSpec: XCTestCase {
    var viewModel: WeatherViewModelImpl!
    var mockWeatherService: MockWeatherService!
    
    @MainActor override func setUp() {
        mockWeatherService = MockWeatherService()
        viewModel = WeatherViewModelImpl(service: mockWeatherService)
    }
    
    func testFetchCities() async {
        let mockCities = [City(name: "Riccione", image: UIImage()), City(name: "Los Angeles", image: UIImage())]
        mockWeatherService.cities = mockCities
        
        await viewModel.getCities()
        
        let cities = await viewModel.weatherInfo.keys
        
        //mockCities == cities
        XCTAssert(mockCities.count == cities.count && mockCities.allSatisfy({cities.contains($0)}))
    }
    
    func testSelectRandomCity() async {
        await setupViewModelState()
        
        mockWeatherService.randomCity = nil
        
        await viewModel.getWeatherUpdates()
        
        let city = mockWeatherService.randomCity

        XCTAssertNotNil(city)
    }
    
    func testUpdateRandomCity() async throws {
        await setupViewModelState()
        
        await viewModel.getWeatherUpdates()
        
        let city = try XCTUnwrap(mockWeatherService.randomCity)
        
        let weatherInfo = await viewModel.weatherInfo
        
        let weather = try XCTUnwrap(weatherInfo[city])
        
        XCTAssertEqual(mockWeatherService.weather.temperature, weather.temperature)
    }
    
    func setupViewModelState() async {
        mockWeatherService.cities = [0...9].map({(value) in
            let cityName = "\(value)City"
            return City(name: cityName, image: UIImage())
        })
        
        await viewModel.getCities()
    }
}
