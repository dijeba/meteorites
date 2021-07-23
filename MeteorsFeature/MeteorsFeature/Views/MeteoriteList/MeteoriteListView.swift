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
    @State private var isDownloading: Bool
    
    private let isFavoriteScreen: Bool
    
    init(isFavoriteScreen: Bool, modelFactory: MeteoriteListModelBuildable = MeteoriteListModelFactory()) {
        
        self.viewModel = MeteoriteListViewModel(isFavoriteScreen: isFavoriteScreen,
                                                modelFactory: modelFactory)
        
        self.isFavoriteScreen = isFavoriteScreen
        
        isDownloading = isFavoriteScreen ? false : true
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if isDownloading {
                    ProgressView {
                        Text(Constants.MeteoriteList.downloadingText)
                            .bold()
                    }.onReceive(viewModel.$isDownloading, perform: { _ in
                        isDownloading = false
                    })
                } else {
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
                }
                
                if !isFavoriteScreen {
                    VStack(spacing: Constants.MeteoriteList.spacingFloatingButtons) {
                        Spacer()
                        HStack {
                            Spacer()
                            RefreshButton {
                                isDownloading = true
                                viewModel.resetFilters()
                                viewModel.downloadMeteorites(force: true)
                            }
                        }
                        HStack {
                            Spacer()
                            FloatingButton {
                                filtersViewIsShowing = true
                            }
                            .sheet(isPresented: $filtersViewIsShowing, content: {
                                FiltersView(
                                    sliderValue: viewModel.stateFiltersModel?.sizeSliderValue,
                                    bridge: viewModel.createBridge(),
                                    filtersViewIsShowing: $filtersViewIsShowing
                                )
                            })
                        }
                    }.padding()
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
