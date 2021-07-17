//
//  MeteoriteCell.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI

struct MeteoriteCell: View {
    
    let meteorite: MeteoriteCellModel
    
    var body: some View {
        VStack {
            HStack {
                TitleTextView(text: meteorite.name)
                Spacer()
                VStack {
                    CaptionTextView(text: meteorite.yearTitle)
                    SubtitleThinTextView(text: meteorite.year)
                }
            }
            .padding()
            
            HStack {
                VStack {
                    CaptionTextView(text: meteorite.massTitle)
                    SubtitleThinTextView(text: meteorite.mass)
                }
                Spacer()
                FavButton(isFavorite: meteorite.isFavorite)
            }
            .padding()
        }
        .overlay(
            RoundedRectangle(
                cornerRadius: Constants.MeteoriteCell.cornerRadius
            )
            .stroke(
                Color("PrimaryColor", bundle: Bundle.module),
                lineWidth: Constants.MeteoriteCell.strokeWidth
            )
            
        )
        .background(
            RoundedRectangle(
                cornerRadius: Constants.MeteoriteCell.cornerRadius
            )
            .fill(Color("SecondaryColor", bundle: Bundle.module))
        )
        .padding()
    }
}

private struct FavButton: View {
    
    @State var isFavorite: Bool
    @Environment(\.colorScheme) var colorScheme
    
    private var systemName: String {
        if colorScheme == .light {
            return isFavorite ? "heart.fill" : "heart"
        } else {
            return "heart.fill"
        }
    }
    
    private var color: Color {
        if isFavorite {
            return Color("AccentColor", bundle: Bundle.module)
        } else {
            return Color("PrimaryColor", bundle: Bundle.module)
        }
    }
    
    var body: some View {
        
        Button(action: {
            print("Fav changed")
        }, label: {
            Image(systemName: systemName)
                .resizable()
                .frame(width: 35, height: 30)
                .foregroundColor(color)
        })
    }
}

struct Cells_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let meteoriteFav = MeteoriteCellModel(
            name: "A Meteorite",
            year: "1985",
            yearTitle: Constants.MeteoriteCell.yearTitle,
            _mass: "800",
            massTitle: Constants.MeteoriteCell.massTitle,
            isFavorite: true
        )
        
        let meteoriteNotFav = MeteoriteCellModel(
            name: "A Meteorite with a very long long name",
            year: "1985",
            yearTitle: Constants.MeteoriteCell.yearTitle,
            _mass: "800",
            massTitle: Constants.MeteoriteCell.massTitle,
            isFavorite: false
        )
        
        VStack {
            MeteoriteCell(meteorite: meteoriteFav)
            MeteoriteCell(meteorite: meteoriteNotFav)
        }
        .preferredColorScheme(.light)
            
        
        VStack {
            MeteoriteCell(meteorite: meteoriteFav)
            MeteoriteCell(meteorite: meteoriteNotFav)
        }
        .preferredColorScheme(.dark)
    }
}
