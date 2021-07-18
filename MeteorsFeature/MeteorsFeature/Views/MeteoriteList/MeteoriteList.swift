//
//  MeteoriteList.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI

public struct MeteoriteList: View {
    
    @State private var model: MeteoriteListModel
    @State private var filtersViewIsShowing = false
    
    public var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(model.cells) { cellModel in
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
                            FiltersView(model: model.makeFiltersViewModel(),
                                        filtersViewIsShowing: $filtersViewIsShowing)
                        })
                    }
                }
            }
            .background(MeteoriteListBackgroundView())
            .navigationTitle(Constants.MeteoriteList.title)
        }
    }
    
    public init(model: MeteoriteListModel) {
        self.model = model
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
}

struct MeteoriteList_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MeteoriteList(model: PreviewMockGenerator.MeteoriteList.model)
            .preferredColorScheme(.light)
        
        MeteoriteList(model: PreviewMockGenerator.MeteoriteList.model)
            .preferredColorScheme(.dark)
    }
}
