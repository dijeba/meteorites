//
//  MeteoriteListView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI
import Combine

struct MeteoriteListView: View {
    
    @ObservedObject private var viewModel: MeteoriteListViewModel
    @State private var filtersViewIsShowing = false
    
    private let isFavoriteScreen: Bool
    
    init(isFavoriteScreen: Bool, modelFactory: MeteoriteListModelBuildable = MeteoriteListModelFactory()) {
        
        self.viewModel = MeteoriteListViewModel(isFavoriteScreen: isFavoriteScreen,
                                                modelFactory: modelFactory)
        
        self.isFavoriteScreen = isFavoriteScreen
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.data.cells) { cellModel in
                        
                        NavigationLink(
                            destination: MapView(meteorite: viewModel.getMeteorite(id: cellModel.modelId)),
                            label: {
                                let viewModel = MeteoriteCellViewModel(
                                    meteorite: viewModel.getMeteorite(id: cellModel.modelId),
                                    data: cellModel
                                )
                                MeteoriteCell(viewModel: viewModel)
                            })
                    }
                    .listRowBackground(Color.clear)
                }
                
                if !isFavoriteScreen {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            FloatingButton {
                                filtersViewIsShowing = true
                            }
                            .sheet(isPresented: $filtersViewIsShowing, content: {
                                FiltersView(bridge: viewModel.createBridge(), filtersViewIsShowing: $filtersViewIsShowing)
                            })
                        }
                    }
                }
            }
            .background(MeteoriteListBackgroundView())
            .navigationTitle(viewModel.data.title)
        }
    }
}

struct MeteoriteList_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MeteoriteListView(isFavoriteScreen: false, modelFactory: MockMeteoriteModelFactory())
            .preferredColorScheme(.light)
        
        MeteoriteListView(isFavoriteScreen: false, modelFactory: MockMeteoriteModelFactory())
            .preferredColorScheme(.dark)
    }
}
