//
//  MeteorsFeature.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 22/07/2021.
//

import SwiftUI

public let meteorsFeature = MeteorsFeature()

public class MeteorsFeature {
    
    public typealias OnMeteoritesUpdate = ([Meteorite]) -> Void
    
    // MARK: - Variables
    
    public enum View {
        case meteoriteList
        case mapView
        case favoriteMeteorites
    }
    
    internal var meteorites: [Meteorite] = [] {
        didSet {
            NotificationCenter.default.post(Notification(name: .meteoriteListUpdated))
        }
    }
    
    // MARK: - Functions
    
    public func show(_ containerView: View) -> MeteorsFeatureContainerView {
        MeteorsFeatureContainerView(viewType: containerView)
    }
}
