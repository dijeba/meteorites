//
//  Meteorite.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

public struct Meteorite {
    
    typealias Coordinates = (lat: Double, lon: Double)
    
    let id: Int
    let name: String
    let isFavorite: Bool
    let mass: Int
    let date: Date
    let coordinates: Coordinates
}
