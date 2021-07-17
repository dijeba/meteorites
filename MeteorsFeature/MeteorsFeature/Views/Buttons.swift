//
//  Buttons.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

import SwiftUI

struct FloatingButton: View {
    
    var body: some View {
        
        Button(action: {
            
        }, label: {
            Image(systemName: "circle.grid.cross")
                .font(.title)
                .foregroundColor(Color("SecondaryColor", bundle: Bundle.module))
                .frame(width: Constants.MeteoriteListBg.floatingButtonSize,
                       height: Constants.MeteoriteListBg.floatingButtonSize)
                .background(
                    Circle().fill(Color("AccentColor", bundle: Bundle.module))
                )
        }).padding()
    }
}

struct Buttons_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack {
            FloatingButton()
        }.preferredColorScheme(.light)
        
        VStack {
            FloatingButton()
        }.preferredColorScheme(.dark)
    }
}
