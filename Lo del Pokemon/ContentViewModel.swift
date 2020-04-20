//
//  ContentViewModel.swift
//  Lo del Pokemon
//
//  Created by Heliodoro Tejedor Navarro on 4/20/20.
//  Copyright © 2020 Heliodoro Tejedor Navarro. All rights reserved.
//

import Combine
import CoreLocation
import Foundation

class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private static let manager = CLLocationManager()
    
    @Published var authorized: Bool = false
    @Published var location: CLLocation = .init()
    
    private var cancellableSet = Set<AnyCancellable>()
    
    public override init() {
        super.init()
        ContentViewModel.manager.delegate = self
        Timer.publish(every: 1, on: .current, in: .common)
            .autoconnect()
            .compactMap { _ in ContentViewModel.manager.location }
            .print()
            .assign(to: \.location, on: self)
            .store(in: &cancellableSet)
    }
    
    func requestAuthorization() {
        ContentViewModel.manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        DispatchQueue.main.async {
            self.authorized = status == .authorizedWhenInUse
        }
    }

}
