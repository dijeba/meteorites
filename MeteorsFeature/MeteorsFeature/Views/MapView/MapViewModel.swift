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
    
    private let modelFactory: MapViewModelBuildable
    private var subscription: AnyCancellable?
    
    init(meteorite: Meteorite,
         modelFactory: MapViewModelBuildable = MapViewModelFactory()) {
        
        self.modelFactory = modelFactory
        self.data = modelFactory.makeModel(meteorite: meteorite)
    }
    
    init(modelFactory: MapViewModelBuildable = MapViewModelFactory()) {
        
        self.modelFactory = modelFactory
        self.data = modelFactory.makeModel(userLocation: .init(),
                                           meteorites: meteorsFeature.meteorites)
        subscribeToNotifications()
    }
    
    deinit {
        subscription?.cancel()
    }
    
    private func subscribeToNotifications() {
        
        subscription = NotificationCenter.default
            .publisher(for: .meteoriteListUpdated)
            .sink(receiveValue: { [weak self] _ in
                
                guard let self = self else {
                    return
                }
                
                DispatchQueue.guaranteeMainThread {
                    self.data = self.modelFactory.makeModel(userLocation: .init(latitude: 0, longitude: 0),
                                                       meteorites: meteorsFeature.meteorites)
                }
            })
    }
    
    func updateLocation(_ location: CLLocationCoordinate2D) {
        DispatchQueue.guaranteeMainThread {
            self.data = self.modelFactory.makeModel(userLocation: location,
                                                    meteorites: meteorsFeature.meteorites)
        }
    }
}
