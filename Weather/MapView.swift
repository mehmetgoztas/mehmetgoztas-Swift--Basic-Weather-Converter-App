//
//  MapView.swift
//  Weather
//
//  Created by Mehmet Göztaş on 19.10.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    static var reigons: [MKCoordinateRegion] =
    [MKCoordinateRegion(
        center:CLLocationCoordinate2D(latitude: 41.0, longitude: 29.0),
        span:MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
        ),
    MKCoordinateRegion(
        center:CLLocationCoordinate2D(latitude: 51.509865, longitude: -0.118092),
       span:MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
       )
     

        
    ]
    @State var reigon: MKCoordinateRegion = reigons[0]
    @State var selectionIndex = 0
    
    var body: some View {
        Map(coordinateRegion: $reigon)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack{
                    Picker("Picker",selection: $selectionIndex,
                           content:{
                               Text("Istanbul").tag(0)
                               Text("London").tag(1)
                           })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of: selectionIndex ,perform:{ value in
                        self.reigon = MapView.reigons[selectionIndex]
                    })
                    Spacer()
                    
                }
               
                
                    
            )
        
    }
}

#Preview {
    MapView()
}
