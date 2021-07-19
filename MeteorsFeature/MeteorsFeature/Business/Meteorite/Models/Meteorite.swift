//
//  Meteorite.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

struct Meteorite {
    
    typealias Coordinates = (lat: Double, lon: Double)
    
    let name: String
    let id: Int
    let isFavorite: Bool
    let mass: Int
    let date: Date
    let coordinates: Coordinates
}
