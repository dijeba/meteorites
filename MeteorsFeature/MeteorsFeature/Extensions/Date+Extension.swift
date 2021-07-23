//
//  Date+Extension.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 23/07/2021.
//

import Foundation

extension Date {
    
    func yearToString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy")
        
        return dateFormatter.string(from: self)
    }
}
