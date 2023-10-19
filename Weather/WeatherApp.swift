//
//  WeatherApp.swift
//  Weather
//
//  Created by Mehmet Göztaş on 19.10.2023.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem{
                        HStack{
                            Image(systemName: "thermometer")
                            Text("Conversion")
                            
                            
                        }
            
                    }
                MapView()
                    .tabItem{
                        HStack{
                            Image(systemName: "map")
                            Text("Map")
                            
                            
                        }
            
                    }

            }
            .accentColor(.purple)
        }
    }
}
