//
//  MeteoriteListBackgroundView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

import SwiftUI

struct MeteoriteListBackgroundView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        
        ZStack {
            GeometryReader { geo in
                Image("meteorite_list_bg", bundle: .module)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width)
                    .opacity(colorScheme == .light ? Constants.MeteoriteListBg.opacityLight : Constants.MeteoriteListBg.opacityDark)
            }
        }
        .background(Color("SecondaryColor", bundle: .module))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MeteoriteListBackgroundView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MeteoriteListBackgroundView()
            .preferredColorScheme(.light)
        
        MeteoriteListBackgroundView()
            .preferredColorScheme(.dark)
    }
}
