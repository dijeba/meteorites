//
//  MeteorsFeature.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 22/07/2021.
//

import SwiftUI
import Combine

public let meteorsFeature = MeteorsFeature()

public class MeteorsFeature {
    
    public typealias OnMeteoritesUpdate = ([Meteorite]) -> Void
    
    // MARK: - Variables
    
    // TODO: review
    public enum View {
        case meteoriteList
//        case mapView(meteorites: [Meteorite])
        case favoriteMeteorites
    }
    
    public var meteorites: [Meteorite] = [] {
        didSet {
            onUpdate?(meteorites)
        }
    }
    
    private var onUpdate: OnMeteoritesUpdate?
    
    // MARK: - Functions
    
    public func show(_ containerView: View,
                     onUpdate: OnMeteoritesUpdate? = nil) -> MeteorsFeatureContainerView {
        
        self.onUpdate = onUpdate
        return MeteorsFeatureContainerView(viewType: containerView)
    }
}

extension Bundle {
    
    static var module: Bundle? {
        Bundle(identifier: "diego.MeteorsFeature")
    }
}
