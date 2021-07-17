//
//  MeteoriteList.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 16/07/2021.
//

import SwiftUI

public struct MeteoriteList: View {
    
    public var body: some View {
        TitleTextView(text: "List of Meteorites")
    }
    
    public init() {}
}

struct MeteoriteList_Previews: PreviewProvider {
    static var previews: some View {
        MeteoriteList()
    }
}
