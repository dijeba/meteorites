//
//  FiltersView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

import SwiftUI

struct FiltersView: View {
    
    @State var model: FiltersViewModel
    @Binding var filtersViewIsShowing: Bool
    
    @State var sliderValue = 50.0
    
    var body: some View {
        
        VStack {
            TitleTextView(text: model.title)
                .padding()
            SubtitleThinTextView(text: model.subtitle)
                .padding()
            VStack {
                HStack {
                    SubtitleTextView(text: model.maxSizeTitle)
                        .padding([.leading, .top, .bottom])
                    SubtitleTextView(text: model.maxSize)
                        .padding([.top, .bottom, .trailing])
                }
                Slider(value: $sliderValue, in: 1.0...100.0)
                    .padding([.leading, .trailing, .bottom])
                    .accentColor(Color("AccentColor", bundle: .module))
            }
            VStack {
                SubtitleTextView(text: model.countrySelectedTitle)
                    .padding([.top, .leading, .trailing])
                SubtitleThinTextView(text: model.countrySelected)
                    .padding()
            }
            ApplyFiltersButton(action: {
                model.saveFilterValues()
                filtersViewIsShowing = false
            })
            .padding()
        }
        .background(Color("SecondaryColor", bundle: .module))
        //.frame(height: 95, alignment: .top)
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        
        FiltersView(model: PreviewMockGenerator.FiltersView.model, filtersViewIsShowing: .constant(true))
            .preferredColorScheme(.light)
        
        FiltersView(model: PreviewMockGenerator.FiltersView.model, filtersViewIsShowing: .constant(true))
            .preferredColorScheme(.dark)
    }
}
