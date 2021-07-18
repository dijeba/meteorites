//
//  MeteoriteListModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

public struct MeteoriteListModel {
    
    let title: String
    let cells: [MeteoriteCellModel]
    
    func makeFiltersViewModel() -> FiltersViewModel {
        
        return FiltersViewModel(
            title: Constants.FiltersView.title,
            subtitle: Constants.FiltersView.subtitle,
            maxSizeTitle: Constants.FiltersView.sizeText,
            _maxSize: 60,
            maxSizeSliderValue: 10,
            countrySelectedTitle: Constants.FiltersView.countrySelectedText,
            countrySelected: "Spain",
            titleApplyButton: Constants.FiltersView.buttonText
        )
    }
}
