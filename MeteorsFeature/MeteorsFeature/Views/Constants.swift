//
//  Constants.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

import UIKit

enum Constants {
    
    enum MeteoriteList {
        static let title = "Meteorites"
        static let titleFavorites = "Favorites"
        static let noLocationFallback = Meteorite.Coordinates(lat: 0, lon: 0)
        static let noDataFallback = "No data"
        static let noDateFallback = Date(timeIntervalSince1970: 946684800) // 2000-01-01T00:00:00.000
        static let spacingFloatingButtons = CGFloat(30)
    }
    
    enum MeteoriteListBg {
        static let opacityLight = 0.1
        static let opacityDark = 0.2
        static let floatingButtonSize = CGFloat(60)
    }
    
    enum FiltersView {
        static let title = "Filters"
        static let subtitle = "Hint: shake your device to clear all the filters"
        static let sizeText = "Max size:"
        static let buttonText = "Apply"
        static let buttonCornerRadius = CGFloat(21)
        static let paddingTopTitle = CGFloat(50)
        static let paddingBottomSaveButton = CGFloat(40)
        static let minSliderValue: Double = 0
        static let maxSliderValue: Double = 10000
        static let defaultSliderValue: Double = 5000
    }
    
    enum TextView {
        static let kerning = CGFloat(1.5)
    }
    
    enum MeteoriteCell {
        static let yearTitle = "Year"
        static let massTitle = "Mass"
        static let cornerRadius = CGFloat(21)
        static let strokeWidth = CGFloat(2)
    }
    
    enum MapView {
        static let nearMeTitle = "Meteorites near me"
        static let defaultCenter: Meteorite.Coordinates = (lat: 40.73, lon: -73.93)
        static let span: Double = 14
        static let cornerRadius = CGFloat(21)
        
        enum Detail {
            static let height = CGFloat(100)
            static let padding = CGFloat(30)
            static let paddingBottom = CGFloat(40)
        }
    }
    
    enum Database {
        static let prefix = "db-meteorite"
    }
}

extension Notification.Name {
    
    static let meteoriteListUpdated = NSNotification.Name("MeteoriteListUpdated")
}
