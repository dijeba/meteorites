//
//  MeteoriteCellModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

struct MeteoriteCellModel {
    
    let name: String
    let year: String
    let yearTitle: String
    let _mass: String
    let massTitle: String
    let isFavorite: Bool
    
    var mass: String {
        _mass + "Kg"
    }
}
