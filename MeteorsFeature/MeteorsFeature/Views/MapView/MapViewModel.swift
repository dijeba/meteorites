//
//  MapViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import SwiftUI
import MapKit

struct MapViewModel {
    
    struct AnnotationItem: Identifiable {
        let id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
    }
    
    @State var region: MKCoordinateRegion
    let title: String
    let userTracked: Bool
    let annotationItems: [AnnotationItem]
    
    var interactionModes: MapInteractionModes {
        userTracked ? .all : .zoom
    }
    
    var userTrackingMode: Binding<MapUserTrackingMode> {
        userTracked ? .constant(.follow) : .constant(.none)
    }
    
//    var annotatedItems: RandomAccessCollection {
//        annotationItems.map{ MapMarker(coordinate: $0.coordinate, tint: Color("AccentColor", bundle: .module)) }
//    }
}
