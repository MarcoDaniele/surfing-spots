//
//  ContentView.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WeatherScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
