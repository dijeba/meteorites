//
//  MeteoriteApiModelMapperTests.swift
//  MeteorsFeatureTests
//
//  Created by Diego Jerez Barroso on 21/07/2021.
//

import XCTest
@testable import MeteorsFeature

class MeteoriteApiModelMapperTests: XCTestCase {
    
    private typealias sut = MeteoriteApiModelMapper
    
    func test_map_apiMeteorites_should_return_business_meteorites() {
        
        let apiModels = [
            MeteoriteMockGenerator.makeApiMeteorite(id: 1),
            MeteoriteMockGenerator.makeApiMeteorite(id: 2),
            MeteoriteMockGenerator.makeApiMeteorite(id: 3),
            MeteoriteMockGenerator.makeApiMeteorite(id: 4),
            MeteoriteMockGenerator.makeApiMeteorite(id: 5)
        ]
        
        let result = sut.map(apiModels)
        
        zip(apiModels, result).forEach(checkModels)
    }
    
    func test_map_apiMeteorites_withASpecificDate() {
        
        let apiModel = APIMeteorite(
            id: "",
            name: "",
            nameType: nil,
            recclass: nil,
            mass: "",
            year: "2021-01-01T00:00:00.000",
            geolocation: .init(type: nil, coordinates: [0, 0])
        )
        
        let result = sut.map([apiModel]).first
        
        let expectedDate = Date(timeIntervalSince1970: 1609459200)
        
        XCTAssertEqual(result?.date, expectedDate)
    }
    
    private func checkModels(_ api: APIMeteorite, business: Meteorite) {
        
        XCTAssertEqual(Int(api.id) ?? 0, business.id)
        XCTAssertEqual(api.name, business.name)
        XCTAssertEqual(api.geolocation?.coordinates?[0], business.coordinates.lat)
        XCTAssertEqual(api.geolocation?.coordinates?[1], business.coordinates.lon)
        
        XCTAssertNil(api.nameType)
        XCTAssertNil(api.recclass)
        XCTAssertEqual(api.year, "aYear")
        XCTAssertEqual(business.date, Constants.MeteoriteList.noDateFallback)
    }
}
