//
//  MeteoriteCellViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 22/07/2021.
//

import Foundation

class MeteoriteCellViewModel {
    
    // MARK: - Properties
    
    let data: MeteoriteCellModel
    private let meteorite: Meteorite
    private let manager: MeteoriteListManagerProtocol
    
    // MARK: - Init
    
    init(meteorite: Meteorite,
         data: MeteoriteCellModel,
         manager: MeteoriteListManagerProtocol = MeteoriteListManager()) {
        
        self.meteorite = meteorite
        self.data = data
        self.manager = manager
    }
    
    // MARK: - Public
    
    func updateFav(_ isFav: Bool) {
        
        if isFav {
            manager.saveFavorite(meteorite: meteorite)
        } else {
            manager.removeFavorite(meteorite: meteorite)
        }
    }
}
