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
