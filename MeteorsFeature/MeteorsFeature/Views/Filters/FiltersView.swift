//
//  FiltersView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

import SwiftUI

struct FiltersView: View {
    
    @State var viewModel: FiltersViewModel
    @State private var sliderValue: Double
    @State var countrySelected: String
    @Binding var filtersViewIsShowing: Bool
    
    init(viewModel: FiltersViewModel = FiltersViewModel(),
         filtersViewIsShowing: Binding<Bool>) {
        
        self.viewModel = viewModel
        self.sliderValue = viewModel.data.sizeSliderValue
        _countrySelected = .init(initialValue: viewModel.data.countrySelected)
        _filtersViewIsShowing = filtersViewIsShowing
    }
    
    var body: some View {
        
        VStack {
            TitleTextView(text: viewModel.data.title)
                .padding(.top, Constants.FiltersView.paddingTopTitle)
                .padding([.leading, .bottom, .trailing])
            CaptionTextView(text: viewModel.data.subtitle)
                .padding()
            VStack {
                HStack {
                    SubtitleTextView(text: viewModel.data.maxSizeTitle)
                        .padding([.leading, .top, .bottom])
                    SubtitleTextView(text: viewModel.data.maxSize)
                        .padding([.top, .bottom, .trailing])
                }
                Slider(value: $sliderValue, in: 1.0...100.0)
                    .padding([.leading, .trailing, .bottom])
                    .accentColor(Color("AccentColor", bundle: .module))
            }
            VStack {
                SubtitleTextView(text: viewModel.data.countrySelectedTitle)
                    .padding([.top, .leading, .trailing])
                
                Picker("Please choose a country", selection: $countrySelected) {
                    ForEach(viewModel.data.countries, id: \.self) {
                        Text($0)
                    }
                }
            }
            Spacer()
            ApplyFiltersButton(action: {
                viewModel.saveFilterValues(sliderValue: sliderValue,
                                           countrySelectedTitle: countrySelected)
                filtersViewIsShowing = false
            })
            .padding(Constants.FiltersView.paddingBottomSaveButton)
        }
        .background(Color("SecondaryColor", bundle: .module))
        .edgesIgnoringSafeArea(.all)
    }
}

struct FiltersView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let mockViewModel = FiltersViewModel(modelFactory: MockFiltersModelFactory())
        
        FiltersView(viewModel: mockViewModel,
                    filtersViewIsShowing: .constant(true))
            .preferredColorScheme(.light)
        
        FiltersView(viewModel: mockViewModel,
                    filtersViewIsShowing: .constant(true))
            .preferredColorScheme(.dark)
    }
}
