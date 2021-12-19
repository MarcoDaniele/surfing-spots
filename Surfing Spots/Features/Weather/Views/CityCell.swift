//
//  CityCell.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import SwiftUI

struct CityCell: View {
    var city: City
    var weather: Weather
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.2)

            HStack {
                VStack(alignment: .leading) {
                    Spacer(minLength: UIScreen.main.bounds.height/8)
                    Text(city.name)
                        .font(.title)
                    Text("\(weather.description) - \(weather.temperature) degrees")
                        .font(.footnote)
                }
                Spacer()
            }
            .padding()
        }
        .background(
            Image(uiImage: weather.isSunny ? city.image : UIImage())
                .resizable()
        )
        .background(Color.gray)
        .foregroundColor(.white)
        .cornerRadius(16)
    }
}
