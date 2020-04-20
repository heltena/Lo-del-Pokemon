//
//  ChachiMapView.swift
//  Lo del Pokemon
//
//  Created by Heliodoro Tejedor Navarro on 4/20/20.
//  Copyright © 2020 Heliodoro Tejedor Navarro. All rights reserved.
//

import SwiftUI
import MapKit

struct ChachiMapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.showsUserLocation = true
    }
    
}
