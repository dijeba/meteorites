//
//  LocationManager.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 23/07/2021.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    @Published var location: CLLocation?
    private let manager = CLLocationManager()
    private var mapViewModel: MapViewModel?
    
    override init() {
        super.init()
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.distanceFilter = kCLDistanceFilterNone
    }
    
    func startUpdatingLocation(_ mapViewModel: MapViewModel) {
        self.mapViewModel = mapViewModel
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {
            return
        }
        
        self.location = location
        
        /// Diego: I have left this out because it seems on the simulator the location tracking is working fine, I can't test on a real device.
        /// If it didn't work on a real device, we would uncomment this in order to update the map's model with every location update.
//        mapViewModel?.updateLocation(location.coordinate)
    }
}
