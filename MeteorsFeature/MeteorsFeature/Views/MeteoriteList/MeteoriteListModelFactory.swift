//
//  MeteoriteListModelFactory.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import Foundation

protocol MeteoriteListModelBuildable {
    
    func makeDefaultModel(isFavoriteScreen: Bool) -> MeteoriteListModel
    func makeModel(meteorites: [Meteorite], isFavoriteScreen: Bool) -> MeteoriteListModel
    func makeFilteredModel(meteorites: [Meteorite], isFavoriteScreen: Bool, minSize: Double) -> MeteoriteListModel
}

struct MeteoriteListModelFactory: MeteoriteListModelBuildable {
    
    func makeDefaultModel(isFavoriteScreen: Bool) -> MeteoriteListModel {
        
        let title = isFavoriteScreen ? Constants.MeteoriteList.titleFavorites : Constants.MeteoriteList.title
        
        return MeteoriteListModel(title: title,
                                  cells: [])
    }
    
    func makeModel(meteorites: [Meteorite], isFavoriteScreen: Bool) -> MeteoriteListModel {
        
        let title = isFavoriteScreen ? Constants.MeteoriteList.titleFavorites : Constants.MeteoriteList.title
        let cells = meteorites.map { createMeteoriteCellModel(from: $0, isFavoriteScreen: isFavoriteScreen) }
        
        return MeteoriteListModel(title: title,
                                  cells: cells)
    }
    
    func makeFilteredModel(meteorites: [Meteorite], isFavoriteScreen: Bool, minSize: Double) -> MeteoriteListModel {
        
        let roundedSize = Int(minSize.rounded())
        let filteredMeteorites = meteorites.filter { $0.mass >= roundedSize }
        
        return makeModel(meteorites: filteredMeteorites, isFavoriteScreen: isFavoriteScreen)
    }
    
    private func createMeteoriteCellModel(from meteorite: Meteorite, isFavoriteScreen: Bool) -> MeteoriteCellModel {
        
        let massString = String(meteorite.mass)
        
        return MeteoriteCellModel(modelId: meteorite.id,
                                  name: meteorite.name,
                                  year: meteorite.date.yearToString(),
                                  yearTitle: Constants.MeteoriteCell.yearTitle,
                                  _mass: massString,
                                  massTitle: Constants.MeteoriteCell.massTitle,
                                  isFavorite: isFavoriteScreen ? true : meteorite.isFavorite)
    }
}
