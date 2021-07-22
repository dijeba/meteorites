//
//  FiltersViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import Foundation

class FiltersViewModel {
    
    let modelFactory: FiltersModelBuildable
    private var _data: FiltersModel?
    
    var data: FiltersModel {
        
        guard let data = _data else {
            assertionFailure("Shouldn't be nil")
            return modelFactory.makeModel(sliderValue: 0, countrySelectedTitle: "")
        }
        
        return data
    }
    
    init(modelFactory: FiltersModelBuildable = FilterModelFactory()) {
        self.modelFactory = modelFactory
        // TODO: data = use manager to retrieve stored filters from db (UserDefaults)
    }
    
    
    func saveFilterValues(sliderValue: Double, countrySelectedTitle: String) {
        
        _data = modelFactory.makeModel(sliderValue: sliderValue,
                                      countrySelectedTitle: countrySelectedTitle)
    }
}
