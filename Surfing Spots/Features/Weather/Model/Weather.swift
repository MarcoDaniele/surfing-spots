//
//  Weather.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import Foundation

struct Weather: Equatable {
    var temperature: Int
    var isSunny: Bool {
        temperature >= 30
    }
    var description: String {
        isSunny ? "sunny" : "cloudy"
    }
}
