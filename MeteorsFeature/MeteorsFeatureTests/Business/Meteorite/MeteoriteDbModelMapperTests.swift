//
//  MeteoriteDbModelMapperTests.swift
//  MeteorsFeatureTests
//
//  Created by Diego Jerez Barroso on 21/07/2021.
//

import XCTest
@testable import MeteorsFeature

class MeteoriteDbModelMapperTests: XCTestCase {
    
    private typealias sut = MeteoriteDbModelMapper
    
    func test_map_dbModelMeteorites_into_businessModel() {
        
        let dbModels = [
            MeteoriteMockGenerator.makeDbMeteorite(id: 1),
            MeteoriteMockGenerator.makeDbMeteorite(id: 2),
            MeteoriteMockGenerator.makeDbMeteorite(id: 3),
            MeteoriteMockGenerator.makeDbMeteorite(id: 4),
            MeteoriteMockGenerator.makeDbMeteorite(id: 5)
        ]
        
        let expectedModels = [
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 1),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 2),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 3),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 4),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 5)
        ]
        
        let result = dbModels.map(sut.map)
        
        zip(result, expectedModels).forEach { XCTAssertEqual($0, $1) }
    }
    
    func test_map_businessModel_into_dbModel() {
        
        let businessModels = [
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 1),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 2),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 3),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 4),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 5)
        ]
        
        let expectedModels = [
            MeteoriteMockGenerator.makeDbMeteorite(id: 1),
            MeteoriteMockGenerator.makeDbMeteorite(id: 2),
            MeteoriteMockGenerator.makeDbMeteorite(id: 3),
            MeteoriteMockGenerator.makeDbMeteorite(id: 4),
            MeteoriteMockGenerator.makeDbMeteorite(id: 5)
        ]
        
        let result = businessModels.map(sut.map)
        
        zip(result, expectedModels).forEach { XCTAssertEqual($0, $1) }
    }
}

extension Meteorite: Equatable {
    
    public static func == (lhs: Meteorite, rhs: Meteorite) -> Bool {
        
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.isFavorite == rhs.isFavorite &&
            lhs.mass == rhs.mass &&
            lhs.date == rhs.date &&
            lhs.coordinates.lat == rhs.coordinates.lat &&
            lhs.coordinates.lon == rhs.coordinates.lon
    }
}

extension DBMeteorite: Equatable {
    public static func == (lhs: DBMeteorite, rhs: DBMeteorite) -> Bool {
        
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.isFavorite == rhs.isFavorite &&
            lhs.mass == rhs.mass &&
            lhs.date == rhs.date &&
            lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.longitude
    }
}
