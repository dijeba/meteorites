//
//  MapViewModelFactory.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import MapKit

protocol MapViewModelBuildable {
    
    func build(meteorite: Meteorite) -> MapViewModel
    func build(userLocation: CLLocationCoordinate2D, meteorites: [Meteorite]) -> MapViewModel
}

class MapViewModelFactory: MapViewModelBuildable {
    
    func build(meteorite: Meteorite) -> MapViewModel {
        
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
        
        return MapViewModel(region: region,
                            title: meteorite.name,
                            userTracked: false,
                            annotationItems: [annotationItem])
    }
    
    func build(userLocation: CLLocationCoordinate2D, meteorites: [Meteorite]) -> MapViewModel {
        
        let span = MKCoordinateSpan(
            latitudeDelta: Constants.MapView.span,
            longitudeDelta: Constants.MapView.span
        )
        
        let region = MKCoordinateRegion(center: userLocation, span: span)
        
        let annotationItems = meteorites.map(createAnnotationItem)
        
        return MapViewModel(region: region,
                            title: Constants.MapView.nearMeTitle,
                            userTracked: true,
                            annotationItems: annotationItems)
    }
    
    private func createAnnotationItem(_ meteorite: Meteorite) -> MapViewModel.AnnotationItem {
        
        let coordinate = CLLocationCoordinate2D(
            latitude: meteorite.coordinates.lat,
            longitude: meteorite.coordinates.lon
        )
        
        return .init(name: meteorite.name, coordinate: coordinate)
    }
}
