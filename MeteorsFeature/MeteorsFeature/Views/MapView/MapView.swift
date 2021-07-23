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
    
    private var viewModel: MapViewModel
    @State private var region: MKCoordinateRegion
    @ObservedObject private var locationManager = LocationManager()
    
    /// Entrance to the DetailView (from MeteoriteListView)
    
    init(meteorite: Meteorite,
         modelFactory: MapViewModelBuildable = MapViewModelFactory()) {
        
        self.viewModel = MapViewModel(meteorite: meteorite, modelFactory: modelFactory)
        self.region = viewModel.data.region
    }
    
    /// Entrance to the NearMe feature (from the tab bar)
    
    init(modelFactory: MapViewModelBuildable = MapViewModelFactory()) {
        
        self.viewModel = MapViewModel(modelFactory: modelFactory)
        self.region = viewModel.data.region
        locationManager.startUpdatingLocation(viewModel)
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            Map(coordinateRegion: $region,
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
        .padding(.bottom, Constants.MapView.Detail.paddingBottom)
        .shadow(radius: 10, x: 5, y: 5)
        
        
    }
}

struct MapView_Previews: PreviewProvider {

    static var previews: some View {

        MapView(meteorite: PreviewMockGenerator.MeteoriteBusinessModel.model,
                modelFactory: MockMapModelFactory())
            .preferredColorScheme(.light)

        MapView(meteorite: PreviewMockGenerator.MeteoriteBusinessModel.model,
                modelFactory: MockMapModelFactory())
            .preferredColorScheme(.dark)
    }
}
