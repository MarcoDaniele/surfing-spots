//
//  City.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import UIKit

struct City: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    let image: UIImage
}
