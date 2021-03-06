//
//  MapViewModelFactory.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import MapKit

protocol MapViewModelBuildable {
    
    func makeModel(meteorite: Meteorite) -> MapModel
    func makeModel(userLocation: CLLocationCoordinate2D, meteorites: [Meteorite]) -> MapModel
}

class MapViewModelFactory: MapViewModelBuildable {
    
    func makeModel(meteorite: Meteorite) -> MapModel {
        
        let center = CLLocationCoordinate2D(
            latitude: meteorite.coordinates.lat,
            longitude: meteorite.coordinates.lon
        )
        
        let span = MKCoordinateSpan(
            latitudeDelta: Constants.MapView.span,
            longitudeDelta: Constants.MapView.span
        )
        
        let region = MKCoordinateRegion(center: center, span: span)
        
        let annotationItem = createAnnotationItem(meteorite)
        
        return MapModel(region: region,
                        title: meteorite.name,
                        userTracked: false,
                        annotationItems: [annotationItem])
    }
    
    func makeModel(userLocation: CLLocationCoordinate2D, meteorites: [Meteorite]) -> MapModel {
        
        let span = MKCoordinateSpan(
            latitudeDelta: Constants.MapView.span,
            longitudeDelta: Constants.MapView.span
        )
        
        let region = MKCoordinateRegion(center: userLocation, span: span)
        
        let annotationItems = meteorites.map(createAnnotationItem)
        
        return MapModel(region: region,
                        title: Constants.MapView.nearMeTitle,
                        userTracked: true,
                        annotationItems: annotationItems)
    }
    
    private func createAnnotationItem(_ meteorite: Meteorite) -> MapModel.AnnotationItem {
        
        let coordinate = CLLocationCoordinate2D(
            latitude: meteorite.coordinates.lat,
            longitude: meteorite.coordinates.lon
        )
        
        return .init(name: meteorite.name, coordinate: coordinate)
    }
}
