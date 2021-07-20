//
//  JSONSerializer.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 20/07/2021.
//

import Foundation

class JSONSerializer {
    
    static func encode<T: Codable>(_ object: T) -> String? {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(object)
            if let string = String(data: data, encoding: .utf8) {
                return string
            }
        } catch {
            print("Error encoding data: \(error)")
        }
        
        return nil
    }
    
    static func decode<T: Codable>(_ string: String) -> T? {
        let decoder = JSONDecoder()
        
        do {
            if let data = string.data(using: .utf8) {
                let object = try decoder.decode(T.self, from: data)
                return object
            }
        } catch {
            print("Error decoding data: \(error)")
        }
        
        return nil
    }
}
