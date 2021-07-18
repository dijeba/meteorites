//
//  Buttons.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

import SwiftUI

struct FloatingButton: View {
    
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action,
               label: {
                Image(systemName: "circle.grid.cross")
                    .font(.title)
                    .foregroundColor(Color("SecondaryColor", bundle: .module))
                    .frame(width: Constants.MeteoriteListBg.floatingButtonSize,
                           height: Constants.MeteoriteListBg.floatingButtonSize)
                    .background(
                        Circle().fill(Color("AccentColor", bundle: .module))
                    )
               })
            .padding()
            .shadow(radius: 10, x: 5, y: 5)
    }
}

struct ApplyFiltersButton: View {
    
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action,
               label: {
                ZStack {
                    RoundedRectangle(
                        cornerRadius: Constants.FiltersView.buttonCornerRadius
                    )
                    .fill(Color("AccentColor", bundle: .module))
                    .frame(width: 295, height: 51)
                    SubtitleTextView(text: "Apply", color: Color("Clear", bundle: .module))
                }
               })
    }
}

struct Buttons_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack {
            FloatingButton(action: {})
            ApplyFiltersButton(action: {})
        }.preferredColorScheme(.light)
        
        VStack {
            FloatingButton(action: {})
            ApplyFiltersButton(action: {})
        }.preferredColorScheme(.dark)
    }
}
