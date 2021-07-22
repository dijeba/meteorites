//
//  TabBarView.swift
//  App-iOS
//
//  Created by Diego Jerez Barroso on 14/07/2021.
//

import SwiftUI
import MeteorsFeature

struct TabBarView: View {
    
    let meteoriteListContainer: MeteorsFeatureContainerView
//    let mapViewContainer: MeteorsFeatureContainerView
    let favoriteMeteoritesContainer: MeteorsFeatureContainerView
    
    @State var meteorites = meteorsFeature.meteorites
    
//    init() {
//        UITabBar.appearance().barTintColor = .white
//        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "ClearBackground")
//    }
    
    var body: some View {
        TabView {
            meteoriteListContainer
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Meteorites")
                }
            
//            meteorsFeature.show(.mapView(meteorites: meteorites))
//                .tabItem {
//                    Image(systemName: "figure.walk")
//                    Text("Near me")
//                }
            
            favoriteMeteoritesContainer
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
        .accentColor(Color("AccentColor"))   
    }
}

// TODO
//struct TabBarView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        TabBarView()
//            .preferredColorScheme(.light)
//
//        TabBarView()
//            .preferredColorScheme(.dark)
//    }
//}
