//
//  City.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import UIKit

struct City: Hashable, Equatable {
    let name: String
    let image: UIImage
}

extension City {
    struct CitiesResponse: Decodable {
        struct CityObject: Decodable {
            var name: String
        }
        var cities: [CityObject]
    }
}
