//
//  Mocks.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import MapKit

class MockMeteoriteModelFactory: MeteoriteListModelBuildable {
    
    func makeDefaultModel() -> MeteoriteListModel {
        return PreviewMockGenerator.MeteoriteList.model
    }
    
    func makeModel(_ meteorites: [Meteorite]) -> MeteoriteListModel {
        return PreviewMockGenerator.MeteoriteList.model
    }
}

class MockFiltersModelFactory: FiltersModelBuildable {
    
    func makeModel(sliderValue: Double, countrySelectedTitle: String) -> FiltersModel {
        return PreviewMockGenerator.FiltersView.model
    }
}

class MockMapModelFactory: MapViewModelBuildable {
    
    func makeModel(meteorite: Meteorite) -> MapModel {
        return PreviewMockGenerator.MapView.singleMeteoriteModel
    }
    
    func makeModel(userLocation: CLLocationCoordinate2D, meteorites: [Meteorite]) -> MapModel {
        return PreviewMockGenerator.MapView.nearMeModel
    }
}
