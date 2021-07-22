//
//  MapModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import SwiftUI
import MapKit

struct MapModel {
    
    struct AnnotationItem: Identifiable {
        let id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
    }
    
    let region: MKCoordinateRegion
    let title: String
    let userTracked: Bool
    let annotationItems: [AnnotationItem]
    
    var interactionModes: MapInteractionModes {
        .all
    }
    
    var userTrackingMode: Binding<MapUserTrackingMode> {
        userTracked ? .constant(.follow) : .constant(.none)
    }
}
