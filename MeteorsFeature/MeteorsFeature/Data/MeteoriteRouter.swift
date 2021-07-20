//
//  MeteoriteRouter.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Networking

enum MeteoriteRouter: EndpointRouter {
    
    case fetchMeteorites
    
    var baseURL: String {
        ""
    }
    
    var method: HTTPMethodType {
        .get
    }
    
    var path: String {
        ""
    }
    
    var parameters: [String : String]? {
        nil
    }
    
    var parametersOneKey: [String : [String]]? {
        nil
    }
    
    var parameterEncoding: ParameterEncodingType {
        .json // TODO: Ojo aqui
    }
    
    var httpHeaders: [String : String]? {
        nil
    }
}
