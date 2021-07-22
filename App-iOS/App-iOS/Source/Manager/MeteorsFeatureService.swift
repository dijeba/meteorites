//
//  MeteorsFeatureService.swift
//  App-iOS
//
//  Created by Diego Jerez Barroso on 22/07/2021.
//

import Foundation
import MeteorsFeature

class MeteorsFeatureService {
    
    private(set) lazy var meteoriteList = {
        return meteorsFeature.show(.meteoriteList)
    }
    
    private(set) lazy var favoriteMeteorites = {
        return meteorsFeature.show(.favoriteMeteorites)
    }
    
//    private(set) lazy var map = {
//        return meteorsFeature.show(.mapView(meteorites: [])) { (meteorites) in
//        }
//    }
}
