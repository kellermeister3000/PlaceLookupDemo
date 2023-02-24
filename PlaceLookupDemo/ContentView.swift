//
//  ContentView.swift
//  PlaceLookupDemo
//
//  Created by Philip Keller on 2/23/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack (alignment: .leading) {
            Text("Location:\n\(locationManager.location?.coordinate.latitude ?? 0.0), \(locationManager.location?.coordinate.longitude ?? 0.0)")
                .padding(.bottom)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() // Location doesn't show in Live Preview - use Simulator
            .environmentObject(LocationManager())
    }
}
