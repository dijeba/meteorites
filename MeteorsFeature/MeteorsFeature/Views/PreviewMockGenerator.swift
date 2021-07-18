//
//  PreviewMockGenerator.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 17/07/2021.
//

import MapKit

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
    
    enum MapView {
        
        static let nearMeModel = MapViewModel(
            region: region,
            title: Constants.MapView.nearMeTitle,
            userTracked: true,
            annotationItems: [
                .init(name: "London's Meteorite", coordinate: generateCoordinate(0)),
                .init(name: "Meteorite A", coordinate: generateCoordinate(1)),
                .init(name: "Meteorite B", coordinate: generateCoordinate(2)),
                .init(name: "Meteorite C", coordinate: generateCoordinate(3))
            ]
        )
        
        static let singleMeteoriteModel = MapViewModel(
            region: region,
            title: "London's Meteorite",
            userTracked: false,
            annotationItems: [
                .init(name: "London's Meteorite", coordinate: generateCoordinate(0))
            ]
        )
        
        private static var region: MKCoordinateRegion {
            
            let center = generateCoordinate(0)
            
            let span = MKCoordinateSpan(
                latitudeDelta: Constants.MapView.span,
                longitudeDelta: Constants.MapView.span
            )
            
            return MKCoordinateRegion(center: center, span: span)
        }
        
        /// Generate random coordinates
        /// - Parameter sum: it is added to the current latitude and lognite. The default lat and lon correspond to London
        /// - Returns: a `CLLocationCoordinate2D` object
        private static func generateCoordinate(_ sum: Double) -> CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: 51.507222 + sum,
                longitude: -0.1275 + sum
            )

        }
    }
}
