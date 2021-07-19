//
//  MeteoriteListViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import Foundation

class MeteoriteListViewModel {
    
    let modelFactory: MeteoriteListModelBuildable
    private(set) var _data: MeteoriteListModel?
    
    var data: MeteoriteListModel {
        
        guard let data = _data else {
            assertionFailure("Shouldn't be nil")
            return modelFactory.makeModel()
        }
        
        return data
    }
    
    init(modelFactory: MeteoriteListModelBuildable = MeteoriteListModelFactory()) {
        self.modelFactory = modelFactory
        setup()
    }
}

// MARK: - Private

extension MeteoriteListViewModel {
    
    private func setup() {
        
        // TODO: download here
    }
}
