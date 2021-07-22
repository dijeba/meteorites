//
//  MeteoriteCell.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI

struct MeteoriteCell: View {
    
    let viewModel: MeteoriteCellViewModel
    
    var body: some View {
        VStack {
            HStack {
                TitleTextView(text: viewModel.data.name)
                Spacer()
                VStack {
                    CaptionTextView(text: viewModel.data.yearTitle)
                    SubtitleThinTextView(text: viewModel.data.year)
                }
            }
            .padding()
            
            HStack {
                VStack {
                    CaptionTextView(text: viewModel.data.massTitle)
                    SubtitleThinTextView(text: viewModel.data.mass)
                }
                Spacer()
                FavButton(viewModel: viewModel, isFavorite: viewModel.data.isFavorite)
            }
            .padding()
        }
        .overlay(
            RoundedRectangle(
                cornerRadius: Constants.MeteoriteCell.cornerRadius
            )
            .stroke(
                Color("PrimaryColor", bundle: .module),
                lineWidth: Constants.MeteoriteCell.strokeWidth
            )
            
        )
        .background(
            RoundedRectangle(
                cornerRadius: Constants.MeteoriteCell.cornerRadius
            )
            .fill(Color("SecondaryColor", bundle: .module))
        )
        .padding()
        .background(Color.clear)
    }
}

private struct FavButton: View {
    
    let viewModel: MeteoriteCellViewModel
    @State var isFavorite: Bool
    
    var body: some View {
        
        Button(action: {
            isFavorite.toggle()
            viewModel.updateFav(isFavorite)
        }, label: {
            Image(systemName: FavoriteButtonModel.systemName(isFav: isFavorite))
                .resizable()
                .frame(width: 35, height: 30)
                .foregroundColor(FavoriteButtonModel.color(isFav: isFavorite))
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct Cells_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let mockViewModel = MeteoriteCellViewModel(meteorite: PreviewMockGenerator.MeteoriteBusinessModel.model,
                                                   data: PreviewMockGenerator.MeteoriteCell.Fav)
        
        VStack {
            MeteoriteCell(viewModel: mockViewModel)
            MeteoriteCell(viewModel: mockViewModel)
        }
        .preferredColorScheme(.light)
            
        
        VStack {
            MeteoriteCell(viewModel: mockViewModel)
            MeteoriteCell(viewModel: mockViewModel)
        }
        .preferredColorScheme(.dark)
    }
}
