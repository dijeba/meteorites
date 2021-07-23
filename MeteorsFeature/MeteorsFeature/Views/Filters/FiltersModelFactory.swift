//
//  FiltersModelFactory.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import Foundation

protocol FiltersModelBuildable {
    
    func makeModel(sliderValue: Double) -> FiltersModel
}

struct FilterModelFactory: FiltersModelBuildable {
    
    func makeModel(sliderValue: Double) -> FiltersModel {
        
        FiltersModel(
            title: Constants.FiltersView.title,
            subtitle: Constants.FiltersView.subtitle,
            maxSizeTitle: Constants.FiltersView.sizeText,
            sizeSliderValue: sliderValue,
            titleApplyButton: Constants.FiltersView.buttonText
        )
    }
}
