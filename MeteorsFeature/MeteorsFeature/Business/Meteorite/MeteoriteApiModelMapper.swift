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
        let mass = Int(apiMeteorite.mass ?? "")
        let date = formatDate(apiMeteorite.year)
        
        var coordinate: Meteorite.Coordinates {
            
            guard let latitude = apiMeteorite.geolocation?.coordinates?[0],
                  let longitude = apiMeteorite.geolocation?.coordinates?[1] else {
                
                return Constants.MeteoriteList.noLocationFallback
            }
            
            return (lat: latitude, lon: longitude)
        }
        
        return Meteorite(id: id,
                         name: apiMeteorite.name ?? Constants.MeteoriteList.noDataFallback,
                         isFavorite: false,
                         mass: mass ?? 0,
                         date: date,
                         coordinates: coordinate)
    }
    
    private static func formatDate(_ dateString: String?) -> Date {
        
        guard let dateString = dateString else {
            return Constants.MeteoriteList.noDateFallback
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-dd-MM'T'HH:mm:ss.SSSS"
        
        return formatter.date(from: dateString) ?? Constants.MeteoriteList.noDateFallback
    }
}
