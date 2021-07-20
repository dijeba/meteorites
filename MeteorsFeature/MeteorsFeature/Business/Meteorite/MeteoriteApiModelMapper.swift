//
//  MeteoriteApiModelMapper.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation

class MeteoriteApiModelMapper {
    
    static func map(_ apiMeteorites: [APIMeteorite]) -> [Meteorite] {
        apiMeteorites.map(mapApiMeteorite)
    }
    
    private static func mapApiMeteorite(_ apiMeteorite: APIMeteorite) -> Meteorite {
        
        let id = Int(apiMeteorite.id) ?? 0
        let isFavorite = false // TODO: UserDefaults...
        let mass = Int(apiMeteorite.mass) ?? 0
        let date = formatDate(apiMeteorite.year)
        let coordinate: Meteorite.Coordinates = (lat: apiMeteorite.geolocation.coordinates[0],
                                                 lon: apiMeteorite.geolocation.coordinates[1])
        
        return Meteorite(id: id,
                         name: apiMeteorite.name,
                         isFavorite: isFavorite,
                         mass: mass,
                         date: date,
                         coordinates: coordinate)
    }
    
    private static func formatDate(_ dateString: String) -> Date {
        
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: dateString) ?? Date(timeIntervalSince1970: 0)
    }
}
