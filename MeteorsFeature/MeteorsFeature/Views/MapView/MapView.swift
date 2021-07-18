//
//  MapView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let model: MapViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            Map(coordinateRegion: model.$region,
                interactionModes: model.interactionModes,
                showsUserLocation: model.userTracked,
                userTrackingMode: model.userTrackingMode,
                annotationItems: model.annotationItems,
                annotationContent: {
                    MapMarker(
                        coordinate: $0.coordinate,
                        tint: Color("AccentColor", bundle: .module)
                    )
                })
                .edgesIgnoringSafeArea(.all)
            
            if !model.userTracked {
                MapDetailView(title: model.title)
            }
        })
    }
}

struct MapDetailView: View {
    
    let title: String
    
    var body: some View {
        
        ZStack(alignment: .leading, content: {
            RoundedRectangle(
                cornerRadius: Constants.MapView.cornerRadius
            )
            .fill(Color("AccentColor", bundle: .module))
            .frame(height: Constants.MapView.Detail.height)
            .padding([.leading, .trailing])
            .blur(radius: 2.0)
            
            SubtitleTextView(text: title,
                             color: Color("Clear", bundle: .module))
                .padding(.leading, Constants.MapView.Detail.padding)
        })
        .shadow(radius: 10, x: 5, y: 5)
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MapView(model: PreviewMockGenerator.MapView.singleMeteoriteModel)
            .preferredColorScheme(.light)
        
        MapView(model: PreviewMockGenerator.MapView.singleMeteoriteModel)
            .preferredColorScheme(.dark)
    }
}
