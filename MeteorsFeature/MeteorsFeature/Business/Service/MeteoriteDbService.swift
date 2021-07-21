//
//  MeteoriteDbService.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation

protocol MeteoriteDbServiceProtocol {
    
    func loadObjects() -> [Meteorite]
    func save(_ object: Meteorite)
    func delete(_ object: Meteorite)
}

class MeteoriteDbService: MeteoriteDbServiceProtocol {
    
    private let database: UserDefaults
    
    init(database: UserDefaults = .standard) {
        self.database = database
    }
    
    func loadObjects() -> [Meteorite] {
        
        let dataModels: [DBMeteorite] = database.dictionaryRepresentation()
            .filter { $0.key.hasPrefix(Constants.Database.prefix) }
            .values
            .compactMap { $0 as? String }
            .compactMap(JSONSerializer.decode)
        
        return dataModels.map(MeteoriteDbModelMapper.map)
    }
    
    func save(_ object: Meteorite) {
        
        let key = "\(Constants.Database.prefix)" + "\(object.id)"
        
        let dataModel = MeteoriteDbModelMapper.map(object)
        let encodedData = JSONSerializer.encode(dataModel)
        
        database.setValue(encodedData, forKey: key)
    }
    
    func delete(_ object: Meteorite) {
        
        let key = "\(Constants.Database.prefix)" + "\(object.id)"
        database.removeObject(forKey: key)
    }
}
