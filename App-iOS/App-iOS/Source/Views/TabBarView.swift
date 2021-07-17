//
//  TabBarView.swift
//  App-iOS
//
//  Created by Diego Jerez Barroso on 14/07/2021.
//

import SwiftUI
import MeteorsFeature

struct TabBarView: View {
    
//    init() {
//        UITabBar.appearance().barTintColor = .white
//        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "ClearBackground")
//    }
    
    var body: some View {
        TabView {
            MeteoriteList()
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Meteorites")
                }
            
            Text("Tab 2")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Near me")
                }
            
            Text("Tab 3")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
        .accentColor(Color("AccentColor"))
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TabBarView()
            .preferredColorScheme(.light)
        
        TabBarView()
            .preferredColorScheme(.dark)
    }
}
