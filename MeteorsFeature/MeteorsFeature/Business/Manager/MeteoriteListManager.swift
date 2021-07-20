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
    
    let apiService: MeteoriteApiServiceProtocol = MeteoriteApiService()
    let dbService: MeteoriteDbServiceProtocol = MeteoriteDbService()
    
    // MARK:- Networking
    
    func fetchMeteorites(completion: @escaping (ServiceResult<[Meteorite]>) -> Void) {
        apiService.fetchMeteorites(completion: completion)
    }
    
    // MARK:- DB
    
    func getFavorites() -> [Meteorite] {
        dbService.loadObjects()
    }
    
    func saveFavorite(meteorite: Meteorite) {
        dbService.save(meteorite)
    }
    
    func removeFavorite(meteorite: Meteorite) {
        dbService.delete(meteorite)
    }
}
