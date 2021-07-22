//
//  MapViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import Foundation
import Combine
import MapKit

class MapViewModel {
    
    @Published var data: MapModel
    
//    init(userLocation: CLLocationCoordinate2D,
//         meteorites: [Meteorite],
//         modelFactory: MapViewModelBuildable = MapViewModelFactory()) {
//
//        self.data = modelFactory.makeModel(userLocation: userLocation, meteorites: meteorites)
//    }
    
    init(meteorite: Meteorite,
         modelFactory: MapViewModelBuildable = MapViewModelFactory()) {
        
        self.data = modelFactory.makeModel(meteorite: meteorite)
    }
}
