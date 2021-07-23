//
//  MockMeteoriteServices.swift
//  MeteorsFeatureTests
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation
import Networking
@testable import MeteorsFeature

class MockMeteoriteApiService: MeteoriteApiServiceProtocol {
    
    func fetchMeteorites(completion: @escaping FetchMeteoritesResult) {
        
        let mock: MockMeteoriteFiles = .getMeteoriteList
        
        do {
            let data = try mock.getData()
            let apiModel = try JSONDecoder().decode([APIMeteorite].self, from: data)
            
            let businessModel = MeteoriteApiModelMapper.map(apiModel)
            completion(.success(businessModel))
        } catch {
            completion(.failure(error))
        }
    }
}

class MeteoriteMockGenerator {
    
    private(set) static var meteoriteDate = Date(timeIntervalSince1970: 0)
    
    static func makeBusinessMeteorite(id: Int, isFavorite: Bool = true, mass: Int  = 1) -> Meteorite {
        
        Meteorite(id: id,
                  name: "M\(id)",
                  isFavorite: isFavorite,
                  mass: mass,
                  date: meteoriteDate,
                  coordinates: (lat: 1, lon: 2))
    }
    
    static func makeApiMeteorite(id: Int) -> APIMeteorite {
        
        APIMeteorite(id: String(id),
                     name: "M\(id)",
                     nameType: nil,
                     recclass: nil,
                     mass: "1",
                     year: "aYear",
                     geolocation: .init(type: nil, coordinates: [1, 2]))
    }
    
    static func makeDbMeteorite(id: Int) -> DBMeteorite {
        
        DBMeteorite(id: id,
                    name: "M\(id)",
                    isFavorite: true,
                    mass: 1,
                    date: meteoriteDate,
                    latitude: 1, longitude: 2)
    }
}
