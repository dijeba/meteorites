//
//  MeteoriteListModelFactory.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import Foundation

protocol MeteoriteListModelBuildable {
    
    // TOOD: modelData here
    func makeModel() -> MeteoriteListModel
}

struct MeteoriteListModelFactory: MeteoriteListModelBuildable {
    
    func makeModel() -> MeteoriteListModel {
        return PreviewMockGenerator.MeteoriteList.model
    }
}
