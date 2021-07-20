//
//  DBMeteorite.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation

struct DBMeteorite: Codable {
    
    let id: Int
    let name: String
    let isFavorite: Bool
    let mass: Int
    let date: Date
    let latitude: Double
    let longitude: Double
}
