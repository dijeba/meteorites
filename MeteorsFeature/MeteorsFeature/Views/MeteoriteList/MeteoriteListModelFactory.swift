//
//  MeteoriteListModelFactory.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import Foundation

protocol MeteoriteListModelBuildable {
    
    func makeDefaultModel() -> MeteoriteListModel
    func makeModel(_ meteorites: [Meteorite]) -> MeteoriteListModel
}

struct MeteoriteListModelFactory: MeteoriteListModelBuildable {
    
    func makeDefaultModel() -> MeteoriteListModel {
        
        return MeteoriteListModel(title: Constants.MeteoriteList.title,
                                  cells: [])
    }
    
    func makeModel(_ meteorites: [Meteorite]) -> MeteoriteListModel {
        
        let cells = meteorites.map(createMeteoriteCellModel)
        
        return MeteoriteListModel(title: Constants.MeteoriteList.title,
                                  cells: cells)
    }
    
    private func createMeteoriteCellModel(from meteorite: Meteorite) -> MeteoriteCellModel {
        
        let massString = String(meteorite.mass)
        
        return MeteoriteCellModel(name: meteorite.name,
                                  year: meteorite.date.yearToString(),
                                  yearTitle: Constants.MeteoriteCell.yearTitle,
                                  _mass: massString,
                                  massTitle: Constants.MeteoriteCell.massTitle,
                                  isFavorite: meteorite.isFavorite)
    }
}

extension Date {
    
    func yearToString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy")
        
        return dateFormatter.string(from: self)
    }
}
