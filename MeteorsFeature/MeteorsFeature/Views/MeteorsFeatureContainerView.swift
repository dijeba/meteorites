//
//  MeteorsFeatureContainerView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 22/07/2021.
//

import SwiftUI

public struct MeteorsFeatureContainerView: View {
    
    private let viewType: MeteorsFeature.View
    
    init(viewType: MeteorsFeature.View) {
        self.viewType = viewType
    }
    
    public var body: some View {
        
        switch viewType {
        case .meteoriteList:
            MeteoriteListView(isFavoriteScreen: false)
        case .mapView:
            MapView()
        case .favoriteMeteorites:
            MeteoriteListView(isFavoriteScreen: true)
        }
    }
}
