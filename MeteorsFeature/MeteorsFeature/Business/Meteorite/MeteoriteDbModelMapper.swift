//
//  MeteoriteDbModelMapper.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation

class MeteoriteDbModelMapper {
    
    static func map(_ dbModel: DBMeteorite) -> Meteorite {
        
        let coordinates: Meteorite.Coordinates = (lat: dbModel.latitude, lon: dbModel.longitude)
        
        return Meteorite(id: dbModel.id,
                         name: dbModel.name,
                         isFavorite: dbModel.isFavorite,
                         mass: dbModel.mass,
                         date: dbModel.date,
                         coordinates: coordinates)
    }
    
    static func map(_ meteorite: Meteorite) -> DBMeteorite {
        
        DBMeteorite(id: meteorite.id,
                    name: meteorite.name,
                    isFavorite: meteorite.isFavorite,
                    mass: meteorite.mass,
                    date: meteorite.date,
                    latitude: meteorite.coordinates.lat,
                    longitude: meteorite.coordinates.lon)
    }
}
