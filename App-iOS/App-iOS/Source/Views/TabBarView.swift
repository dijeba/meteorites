//
//  TabBarView.swift
//  App-iOS
//
//  Created by Diego Jerez Barroso on 14/07/2021.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Text("Home Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Text("Bookmark Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Bookmark")
                }
            
            Text("Video Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("Video")
                }
        }
        .accentColor(Color("AccentColor"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().preferredColorScheme(.light)
        TabBarView().preferredColorScheme(.dark)
    }
}
