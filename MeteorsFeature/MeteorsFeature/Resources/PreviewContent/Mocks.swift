//
//  Mocks.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import MapKit

class MockMeteoriteModelFactory: MeteoriteListModelBuildable {
    
    func makeFilteredModel(meteorites: [Meteorite], isFavoriteScreen: Bool, maxSize: Double) -> MeteoriteListModel {
        return PreviewMockGenerator.MeteoriteList.model
    }

    func makeDefaultModel(isFavoriteScreen: Bool) -> MeteoriteListModel {
        return PreviewMockGenerator.MeteoriteList.model
    }
    
    func makeModel(meteorites: [Meteorite], isFavoriteScreen: Bool) -> MeteoriteListModel {
        return PreviewMockGenerator.MeteoriteList.model
    }
}

class MockFiltersModelFactory: FiltersModelBuildable {
    
    func makeModel(sliderValue: Double) -> FiltersModel {
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
