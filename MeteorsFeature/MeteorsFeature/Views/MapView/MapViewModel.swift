//
//  MapViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import Foundation

class MapViewModel {
    
    let modelFactory: MapViewModelBuildable
    private(set) var _data: MapModel?
    
    var data: MapModel {
        
        guard let data = _data else {
            assertionFailure("Shouldn't be nil")
            return modelFactory.makeModel(meteorite: PreviewMockGenerator.MeteoriteBusinessModel.model)
        }
        
        return data
    }
    
    init(modelFactory: MapViewModelBuildable = MapViewModelFactory()) {
        self.modelFactory = modelFactory
    }
}
