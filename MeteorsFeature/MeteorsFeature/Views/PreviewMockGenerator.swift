//
//  PreviewMockGenerator.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

enum PreviewMockGenerator {
    
    enum MeteoriteList {
        
        static let model = MeteoriteListModel(
            title: Constants.MeteoriteList.title,
            cells: [
                MeteoriteCell.Fav,
                MeteoriteCell.NotFav,
                MeteoriteCell.Fav,
                MeteoriteCell.NotFav,
                MeteoriteCell.Fav,
                MeteoriteCell.NotFav,
                MeteoriteCell.Fav,
                MeteoriteCell.NotFav
            ]
        )
    }
    
    enum MeteoriteCell {
        
        static let Fav = MeteoriteCellModel(
            name: "A Meteorite",
            year: "1985",
            yearTitle: Constants.MeteoriteCell.yearTitle,
            _mass: "800",
            massTitle: Constants.MeteoriteCell.massTitle,
            isFavorite: true
        )
        
        static let NotFav = MeteoriteCellModel(
            name: "A Meteorite with a very long long name",
            year: "1985",
            yearTitle: Constants.MeteoriteCell.yearTitle,
            _mass: "800",
            massTitle: Constants.MeteoriteCell.massTitle,
            isFavorite: false
        )
    }
    
    enum FiltersView {
        
        static let model = FiltersViewModel(
            title: Constants.FiltersView.title,
            subtitle: Constants.FiltersView.subtitle,
            maxSizeTitle: Constants.FiltersView.sizeText,
            _maxSize: 60,
            maxSizeSliderValue: 50,
            countrySelectedTitle: Constants.FiltersView.countrySelectedText,
            countrySelected: "USA",
            titleApplyButton: Constants.FiltersView.buttonText
        )
    }
}
