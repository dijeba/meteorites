//
//  MeteoriteRouter.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Networking

private enum RouterConst {
    
    enum BaseURL {
        static let prod = "https://data.nasa.gov"
    }
    
    enum Path {
        static let meteoriteLandingsPath = "/resource/y77d-th95.json"
    }
    
    enum Token {
        static let value = "mb03SrMQidJqCg3G5hKPl5U59"
    }
}

enum MeteoriteRouter: EndpointRouter {
    
    case fetchMeteorites
    
    var baseURL: String {
        switch self {
        case .fetchMeteorites:
            return RouterConst.BaseURL.prod
        }
    }
    
    var method: HTTPMethodType {
        switch self {
        case .fetchMeteorites:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchMeteorites:
            return RouterConst.Path.meteoriteLandingsPath
        }
    }
    
    var parameters: [String : String]? {
        switch self {
        case .fetchMeteorites:
            return [
                "$where": "year > '1900-01-01T00:00:00'"
            ]
        }
    }
    
    var parametersOneKey: [String : [String]]? {
        nil
    }
    
    var parameterEncoding: ParameterEncodingType {
        .json
    }
    
    var httpHeaders: [String : String]? {
        [
            "X-App-Token": RouterConst.Token.value,
            "Content-Type": "application/json-patch+json",
            "Accept": "application/json"
        ]
    }
}
