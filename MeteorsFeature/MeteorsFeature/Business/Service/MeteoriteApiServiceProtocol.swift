//
//  MeteoriteApiServiceProtocol.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Networking

typealias ServiceResult<T> = Result<T, Error>

protocol MeteoriteApiServiceProtocol {
    
    typealias FetchMeteoritesResult = (ServiceResult<[Meteorite]>) -> Void
    
    func fetchMeteorites(completion: @escaping FetchMeteoritesResult)
}

class MeteoriteApiService: MeteoriteApiServiceProtocol {
    
    func fetchMeteorites(completion: @escaping FetchMeteoritesResult) {
        
        let router = MeteoriteRouter.fetchMeteorites
        
        let response: NetworkResult<[APIMeteorite]> = { result in
            
            switch result {
            case .success(let apiMeteorites):
                let businessModel = MeteoriteApiModelMapper.map(apiMeteorites)
                completion(.success(businessModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        NetworkLayer.requestDecodable(router: router, completion: response)
    }
}
