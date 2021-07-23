//
//  TabBarView.swift
//  App-iOS
//
//  Created by Diego Jerez Barroso on 14/07/2021.
//

import SwiftUI
import MeteorsFeature

struct TabBarView: View {
    
    //@State var meteorites = meteorsFeature.meteorites
    
    let meteoriteListContainer: MeteorsFeatureContainerView
    let mapViewContainer: MeteorsFeatureContainerView
    let favoriteMeteoritesContainer: MeteorsFeatureContainerView
    
    var body: some View {
        TabView {
            meteoriteListContainer
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Meteorites")
                }
            
            mapViewContainer
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Near me")
                }
            
            favoriteMeteoritesContainer
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
        .accentColor(Color("AccentColor"))   
    }
}
