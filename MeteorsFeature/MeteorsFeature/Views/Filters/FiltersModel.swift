//
//  FiltersModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import Foundation

struct FiltersModel {
    
    let title: String
    let subtitle: String
    let maxSizeTitle: String
    let sizeSliderValue: Double
    let countrySelectedTitle: String
    let countrySelected: String
    let titleApplyButton: String
    
    var maxSize: String {
        "> \(sizeSliderValue.rounded()) Kg"
    }
    
    var countries: [String] {
        ["Spain", "Germany", "Ireland", "US", "Spain", "Germany", "Ireland", "US", "Spain", "Germany", "Ireland", "US", "Spain", "Germany", "Ireland", "US", "Spain", "Germany", "Ireland", "US", "Spain", "Germany", "Ireland", "US"]
    }
}
