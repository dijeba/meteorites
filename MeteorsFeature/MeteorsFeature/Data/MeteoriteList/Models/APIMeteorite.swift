//
//  APIMeteorite.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation

struct APIMeteorite: Decodable {
    
    let id: String
    let name: String?
    let nameType: String?
    let recclass: String?
    let mass: String?
    let year: String?
    let geolocation: Geolocation?
}

extension APIMeteorite {
    
    struct Geolocation: Decodable {
        
        let type: String?
        let coordinates: [Double]?
    }
}
