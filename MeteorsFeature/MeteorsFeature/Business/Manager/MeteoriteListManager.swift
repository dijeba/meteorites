//
//  MeteoriteListManager.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation

protocol MeteoriteListManagerProtocol {
    
    var apiService: MeteoriteApiServiceProtocol { get }
    var dbService: MeteoriteDbServiceProtocol { get }
    
    func fetchMeteorites(completion: @escaping MeteoriteApiServiceProtocol.FetchMeteoritesResult)
    
    func getFavorites() -> [Meteorite]
    func saveFavorite(meteorite: Meteorite)
    func removeFavorite(meteorite: Meteorite)
}

class MeteoriteListManager: MeteoriteListManagerProtocol {
    
    let apiService: MeteoriteApiServiceProtocol
    let dbService: MeteoriteDbServiceProtocol
    
    init(apiService: MeteoriteApiServiceProtocol = MeteoriteApiService(),
         dbService: MeteoriteDbServiceProtocol = MeteoriteDbService()) {
        
        self.apiService = apiService
        self.dbService = dbService
    }
    
    // MARK: - Networking
    
    func fetchMeteorites(completion: @escaping (ServiceResult<[Meteorite]>) -> Void) {
        apiService.fetchMeteorites(completion: completion)
    }
    
    // MARK: - DB
    
    func getFavorites() -> [Meteorite] {
        dbService.loadObjects()
    }
    
    func saveFavorite(meteorite: Meteorite) {
        dbService.save(meteorite)
        updateMeteorite(id: meteorite.id, isFav: !meteorite.isFavorite)
    }
    
    func removeFavorite(meteorite: Meteorite) {
        dbService.delete(meteorite)
        updateMeteorite(id: meteorite.id, isFav: !meteorite.isFavorite)
    }
    
    private func updateMeteorite(id: Int, isFav: Bool) {
        
        let updatedList = meteorsFeature.meteorites.map { m -> Meteorite in
            
            if m.id == id {
                return Meteorite(
                    id: m.id,
                    name: m.name,
                    isFavorite: isFav,
                    mass: m.mass,
                    date: m.date,
                    coordinates: m.coordinates
                )
            } else {
                return m
            }
        }
        
        meteorsFeature.meteorites = updatedList
    }
}
