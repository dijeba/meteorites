//
//  TextViews.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI

// TODO: Move to other place
extension Bundle {
    
    static var module: Bundle? {
        Bundle(identifier: "diego.MeteorsFeature")
    }
}

struct TitleTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("PrimaryColor", bundle: .module))
            .bold()
            .font(.title)
            .fontWeight(.black)
            .kerning(Constants.TextView.kerning)
    }
}

struct SubtitleTextView: View {
    
    let text: String
    let color: Color
    let textAlignment: TextAlignment
    
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .bold()
            .font(.title2)
            .fontWeight(.black)
            .kerning(Constants.TextView.kerning)
            .multilineTextAlignment(textAlignment)
    }
    
    init(text: String,
         color: Color = Color("PrimaryColor", bundle: .module),
         textAlignment: TextAlignment = .center) {
        
        self.text = text
        self.color = color
        self.textAlignment = textAlignment
    }
}

struct SubtitleThinTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("PrimaryColor", bundle: .module))
            .font(.title2)
            .fontWeight(.light)
            .kerning(Constants.TextView.kerning)
    }
}

struct CaptionTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("PrimaryColor", bundle: .module))
            .font(.caption)
            .kerning(Constants.TextView.kerning)
    }
}

struct TextViews_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack {
            TitleTextView(text: "Title")
            SubtitleTextView(text: "Subtitle")
            SubtitleThinTextView(text: "ThinText")
            CaptionTextView(text: "Caption")
        }
        .preferredColorScheme(.light)
        
        VStack {
            TitleTextView(text: "Title")
            SubtitleTextView(text: "Subtitle")
            SubtitleThinTextView(text: "ThinText")
            CaptionTextView(text: "Caption")
        }
        .preferredColorScheme(.dark)
    }
}
