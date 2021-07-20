//
//  MockMeteoriteFiles.swift
//  MeteorsFeatureTests
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation
@testable import MeteorsFeature

enum MockMeteoriteFiles {
    
    case getMeteoriteList
    
    func getData() throws -> Data {
        
        guard let url = Bundle.module?.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "meteorsFeature", code: 1, userInfo: [:])
        }
        
        return try Data(contentsOf: url)
    }
    
    private var fileName: String {
        switch self {
        case .getMeteoriteList:
            return "get-meteorite-list"
        }
    }
}
