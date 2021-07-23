//
//  MeteoriteListBridge.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 23/07/2021.
//

import Foundation

struct MeteoriteListBridge {
    
    typealias OnNewFilterSelected = (_ filtersModel: FiltersModel) -> Void
    
    let onNewFilterSelected: OnNewFilterSelected?
}
