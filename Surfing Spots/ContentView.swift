//
//  ContentView.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import SwiftUI

struct ContentView: View {
    let cities: [City: Weather]
    
    var body: some View {
        NavigationView {
            WeatherScreen(cities: cities)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let mockCities: [City: Weather] = [City(name: "Riccione", image: UIImage(named: "city1")!): Weather(temperature: 30), City(name: "Miami", image: UIImage(named: "city2")!): Weather(temperature: 30), City(name: "Los Angeles", image: UIImage(named: "city3")!): Weather(temperature: 30)]
    
    static var previews: some View {
        ContentView(cities: mockCities)
    }
}
