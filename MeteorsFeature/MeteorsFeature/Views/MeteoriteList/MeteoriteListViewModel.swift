//
//  MeteoriteListViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import Foundation
import Combine

class MeteoriteListViewModel: ObservableObject {
    
    @Published var data: MeteoriteListModel
    
    private let modelFactory: MeteoriteListModelBuildable
    private let manager: MeteoriteListManagerProtocol
    
    init(modelFactory: MeteoriteListModelBuildable = MeteoriteListModelFactory(),
         manager: MeteoriteListManagerProtocol = MeteoriteListManager()) {
        
        self.modelFactory = modelFactory
        self.manager = manager
        self.data = modelFactory.makeDefaultModel()
        
        setup()
    }
}

// MARK: - Private

extension MeteoriteListViewModel {
    
    private func setup() {
        
        manager.fetchMeteorites { [weak self] result in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let meteorites):
                let processedMeteorites = self.processFavorites(meteorites: meteorites, favorites: self.manager.getFavorites())
                self.data = self.modelFactory.makeModel(processedMeteorites)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func processFavorites(meteorites: [Meteorite],
                                  favorites: [Meteorite]) -> [Meteorite] {
        
        let idFavorites = favorites.map { $0.id }
        
        return favorites.map { m -> Meteorite in
            
            if idFavorites.contains(m.id) {
                return Meteorite(
                    id: m.id,
                    name: m.name,
                    isFavorite: true,
                    mass: m.mass,
                    date: m.date,
                    coordinates: m.coordinates
                )
            } else {
                return m
            }
        }
    }
}
