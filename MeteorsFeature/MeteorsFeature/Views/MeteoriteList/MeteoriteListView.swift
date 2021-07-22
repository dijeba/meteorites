//
//  MeteoriteListView.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI
import Combine

public struct MeteoriteListView: View {
    
    @ObservedObject private var viewModel: MeteoriteListViewModel
    @State private var filtersViewIsShowing = false
    
    init(viewModel: MeteoriteListViewModel = MeteoriteListViewModel()) {
        self.viewModel = viewModel
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    public var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.data.cells) { cellModel in
                        MeteoriteCell(model: cellModel)
                    }
                    .listRowBackground(Color.clear)
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingButton {
                            filtersViewIsShowing = true
                        }
                        .sheet(isPresented: $filtersViewIsShowing, content: {
                            FiltersView(filtersViewIsShowing: $filtersViewIsShowing)
                        })
                    }
                }
            }
            .background(MeteoriteListBackgroundView())
            .navigationTitle(Constants.MeteoriteList.title)
        }
    }
}

struct MeteoriteList_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let mockViewModel = MeteoriteListViewModel(modelFactory: MockMeteoriteModelFactory())
        
        MeteoriteListView(viewModel: mockViewModel)
            .preferredColorScheme(.light)
        
        MeteoriteListView(viewModel: mockViewModel)
            .preferredColorScheme(.dark)
    }
}
