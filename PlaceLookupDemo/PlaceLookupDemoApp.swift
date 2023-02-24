//
//  PlaceLookupDemoApp.swift
//  PlaceLookupDemo
//
//  Created by Philip Keller on 2/23/23.
//

import SwiftUI

@main
struct PlaceLookupDemoApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
