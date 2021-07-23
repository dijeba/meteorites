//
//  FiltersViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import Foundation
import Combine

class FiltersViewModel: ObservableObject {
    
    @Published var data: FiltersModel
    private let modelFactory: FiltersModelBuildable
    private let bridge: MeteoriteListBridge
    
    init(modelFactory: FiltersModelBuildable = FilterModelFactory(),
         bridge: MeteoriteListBridge) {
        
        self.modelFactory = modelFactory
        self.bridge = bridge
        self.data = modelFactory.makeModel(
            sliderValue: bridge.filtersModel?.sizeSliderValue ?? Constants.FiltersView.defaultSliderValue
        )
    }
    
    
    func saveFilterValues(sliderValue: Double) {
        
        data = modelFactory.makeModel(sliderValue: sliderValue)
        bridge.onNewFilterSelected?(data, false)
    }
    
    func resetFilterValues() {
        
        data = modelFactory.makeModel(sliderValue: Constants.FiltersView.defaultSliderValue)
        bridge.onNewFilterSelected?(data, true)
    }
    
    func formatSliderValue(_ value: Double) -> String {
        
        let rounded = String(format: "%.0f", value.rounded())
        return "> \(rounded) g"
    }
}
