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
            List([City](cities.keys)) { city in
                
                ZStack {
                    Color.black
                        .opacity(0.2)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Spacer(minLength: UIScreen.main.bounds.height/8)
                            Text(city.name)
                                .font(.title)
                            Text("\(cities[city]!.description) - \(cities[city]!.temperature) degrees")
                                .font(.footnote)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .background(
                    Image(uiImage: cities[city]!.isSunny ? city.image : UIImage())
                        .resizable()
                )
                .foregroundColor(.white)
                .cornerRadius(16)
                .listRowSeparator(.hidden)
                .listRowInsets(.none)
            }
            .listStyle(.plain)
            .navigationTitle("Surfing Spots")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let mockCities: [City: Weather] = [City(name: "Riccione", image: UIImage(named: "city1")!): Weather(temperature: 30), City(name: "Miami", image: UIImage(named: "city2")!): Weather(temperature: 30), City(name: "Los Angeles", image: UIImage(named: "city3")!): Weather(temperature: 30)]
    
    static var previews: some View {
        ContentView(cities: mockCities)
    }
}


struct City: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    let image: UIImage
}

struct Weather: Equatable {
    var temperature: Int
    var isSunny: Bool {
        temperature >= 30
    }
    var description: String {
        isSunny ? "sunny" : "cloudy"
    }
}
