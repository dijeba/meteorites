//
//  MeteoriteCellViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 22/07/2021.
//

import Foundation

class MeteoriteCellViewModel {
    
    let data: MeteoriteCellModel
    private let meteorite: Meteorite
    private let manager: MeteoriteListManagerProtocol
    
    init(meteorite: Meteorite,
         data: MeteoriteCellModel,
         manager: MeteoriteListManagerProtocol = MeteoriteListManager()) {
        
        self.meteorite = meteorite
        self.data = data
        self.manager = manager
    }
    
    func updateFav(_ isFav: Bool) {
        
        if isFav {
            manager.saveFavorite(meteorite: meteorite)
        } else {
            manager.removeFavorite(meteorite: meteorite)
        }
    }
}
