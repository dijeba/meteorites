//
//  MeteoriteCell.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI

struct MeteoriteCell: View {
    
    let model: MeteoriteCellModel
    
    var body: some View {
        VStack {
            HStack {
                TitleTextView(text: model.name)
                Spacer()
                VStack {
                    CaptionTextView(text: model.yearTitle)
                    SubtitleThinTextView(text: model.year)
                }
            }
            .padding()
            
            HStack {
                VStack {
                    CaptionTextView(text: model.massTitle)
                    SubtitleThinTextView(text: model.mass)
                }
                Spacer()
                FavButton(isFavorite: model.isFavorite)
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
    
    @State var isFavorite: Bool
    
    var body: some View {
        
        Button(action: {
            isFavorite.toggle()
        }, label: {
            Image(systemName: FavoriteButtonModel.systemName(isFav: isFavorite))
                .resizable()
                .frame(width: 35, height: 30)
                .foregroundColor(FavoriteButtonModel.color(isFav: isFavorite))
        })
    }
}

struct Cells_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack {
            MeteoriteCell(model: PreviewMockGenerator.MeteoriteCell.Fav)
            MeteoriteCell(model: PreviewMockGenerator.MeteoriteCell.NotFav)
        }
        .preferredColorScheme(.light)
            
        
        VStack {
            MeteoriteCell(model: PreviewMockGenerator.MeteoriteCell.Fav)
            MeteoriteCell(model: PreviewMockGenerator.MeteoriteCell.NotFav)
        }
        .preferredColorScheme(.dark)
    }
}
