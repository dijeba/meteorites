//
//  App_iOSApp.swift
//  App-iOS
//
//  Created by Diego Jerez Barroso on 14/07/2021.
//

import SwiftUI
import MeteorsFeature

@main
struct App_iOSApp: App {
    
    let service = MeteorsFeatureService()
    
    var body: some Scene {
        WindowGroup {
            TabBarView(meteoriteListContainer: service.meteoriteList(),
                       //mapViewContainer: service.map(),
                       favoriteMeteoritesContainer: service.favoriteMeteorites())
        }
    }
}
