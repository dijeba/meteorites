//
//  FiltersView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

import SwiftUI

struct FiltersView: View {
    
    @ObservedObject var viewModel: FiltersViewModel
    @State var sliderValue: Double
    @Binding var filtersViewIsShowing: Bool
    
    init(modelFactory: FiltersModelBuildable = FilterModelFactory(),
         sliderValue: Double?,
         bridge: MeteoriteListBridge,
         filtersViewIsShowing: Binding<Bool>) {
        
        self.viewModel = FiltersViewModel(modelFactory: modelFactory, bridge: bridge)
        _filtersViewIsShowing = filtersViewIsShowing
        self.sliderValue = sliderValue ?? Constants.FiltersView.defaultSliderValue
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
                    SubtitleTextView(text: viewModel.formatSliderValue(sliderValue))
                        .padding([.top, .bottom, .trailing])
                }
                
                Slider(
                    value: $sliderValue,
                    in: Constants.FiltersView.minSliderValue...Constants.FiltersView.maxSliderValue
                )
                .padding([.leading, .trailing, .bottom])
                .accentColor(Color("AccentColor", bundle: .module))
            }
            
            Spacer()
            
            VStack(spacing: Constants.FiltersView.spacingFloatingButtons) {
                ResetFiltersButton {
                    viewModel.resetFilterValues()
                    filtersViewIsShowing = false
                }
                ApplyFiltersButton(action: {
                    viewModel.saveFilterValues(sliderValue: sliderValue)
                    filtersViewIsShowing = false
                })
            }
            .padding(Constants.FiltersView.paddingBottomSaveButton)
        }
        .background(Color("SecondaryColor", bundle: .module))
        .edgesIgnoringSafeArea(.all)
    }
}

struct FiltersView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let bridge = MeteoriteListBridge(filtersModel: nil, onNewFilterSelected: nil)
        let mockFactory = MockFiltersModelFactory()
        
        FiltersView(modelFactory: mockFactory,
                    sliderValue: nil,
                    bridge: bridge,
                    filtersViewIsShowing: .constant(true))
            .preferredColorScheme(.light)
        
        FiltersView(modelFactory: mockFactory,
                    sliderValue: nil,
                    bridge: bridge,
                    filtersViewIsShowing: .constant(true))
            .preferredColorScheme(.dark)
    }
}
