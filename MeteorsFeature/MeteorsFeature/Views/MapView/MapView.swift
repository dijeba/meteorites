//
//  MapView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 18/07/2021.
//

import SwiftUI
import Combine
import MapKit

struct MapView: View {
    
    @ObservedObject private var viewModel: MapViewModel
    
    init(meteorite: Meteorite) {
        self.viewModel = MapViewModel(meteorite: meteorite)
    }
    
    init(meteorites: [Meteorite]) {
        
        // TODO: get user's location
        
        self.viewModel = MapViewModel(userLocation: .init(latitude: 1, longitude: 1),
                                      meteorites: meteorites)
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            Map(coordinateRegion: viewModel.data.$region,
                interactionModes: viewModel.data.interactionModes,
                showsUserLocation: viewModel.data.userTracked,
                userTrackingMode: viewModel.data.userTrackingMode,
                annotationItems: viewModel.data.annotationItems,
                annotationContent: {
                    MapMarker(
                        coordinate: $0.coordinate,
                        tint: Color("AccentColor", bundle: .module)
                    )
                })
                .edgesIgnoringSafeArea(.all)
            
            if !viewModel.data.userTracked {
                MapDetailView(title: viewModel.data.title)
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
            
            SubtitleTextView(text: title,
                             color: Color("Clear", bundle: .module))
                .padding(.leading, Constants.MapView.Detail.padding)
        })
        .shadow(radius: 10, x: 5, y: 5)
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let mockViewModel = MapViewModel(modelFactory: MockMapModelFactory())
        
        MapView(viewModel: mockViewModel)
            .preferredColorScheme(.light)
        
        MapView(viewModel: mockViewModel)
            .preferredColorScheme(.dark)
    }
}
