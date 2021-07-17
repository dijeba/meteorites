//
//  MeteoriteCellModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI

struct MeteoriteCellModel: Identifiable {
    
    var id = UUID()
    
    let name: String
    let year: String
    let yearTitle: String
    let _mass: String
    let massTitle: String
    let isFavorite: Bool
    
    var mass: String {
        _mass + "Kg"
    }
}

struct FavoriteButtonModel {
    
    @Environment(\.colorScheme) static private var colorScheme
    
    static func systemName(isFav: Bool) -> String {
        if colorScheme == .light {
            return isFav ? "heart.fill" : "heart"
        } else {
            return "heart.fill"
        }
    }
    
    static func color(isFav: Bool) -> Color {
        if isFav {
            return Color("AccentColor", bundle: Bundle.module)
        } else {
            return Color("PrimaryColor", bundle: Bundle.module)
        }
    }
}
