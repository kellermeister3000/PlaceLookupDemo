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
    @State private var showPlaceLookupSheet = false
    @State var returnedPlace = Place(mapItem: MKMapItem())
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Location:\n\(locationManager.location?.coordinate.latitude ?? 0.0), \(locationManager.location?.coordinate.longitude ?? 0.0)")
                    .padding(.bottom)
                
                Text("Returned Place: \nName: \(returnedPlace.name) \nAddress:\(returnedPlace.address)\nCoords: \(returnedPlace.latitude), \(returnedPlace.longitude)")
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showPlaceLookupSheet.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                        Text("Lookup Place")
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showPlaceLookupSheet) {
            PlaceLookupView(returnedPlace: $returnedPlace)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() // Location doesn't show in Live Preview - use Simulator
            .environmentObject(LocationManager())
    }
}
