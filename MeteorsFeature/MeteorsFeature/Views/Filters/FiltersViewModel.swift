//
//  FiltersViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

struct FiltersViewModel {
    
    let title: String
    let subtitle: String
    let maxSizeTitle: String
    let _maxSize: Int
    let maxSizeSliderValue: Double
    let countrySelectedTitle: String
    let countrySelected: String
    let titleApplyButton: String
    
    var maxSize: String {
        "> \(_maxSize) Kg"
    }
    
    func saveFilterValues() {
        
    }
}
