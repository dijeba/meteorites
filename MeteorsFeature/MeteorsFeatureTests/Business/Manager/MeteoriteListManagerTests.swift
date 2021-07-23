//
//  MeteoriteListManagerTests.swift
//  MeteorsFeatureTests
//
//  Created by Diego Jerez Barroso on 21/07/2021.
//

import XCTest
@testable import MeteorsFeature

class MeteoriteListManagerTests: XCTestCase {
    
    private var spyDbService: SpyDbService!
    private var mockMeteoriteApiService: MockMeteoriteApiService!
    private var sut: MeteoriteListManager!
    
    override func setUp() {
        super.setUp()
        
        spyDbService = SpyDbService()
        mockMeteoriteApiService = MockMeteoriteApiService()
        
        sut = MeteoriteListManager(apiService: mockMeteoriteApiService,
                                   dbService: spyDbService)
    }
    
    func test_fetchMeteorites() {
        
        let exp = expectation(description: "fetchMeteorites_response_exp")
        
        let response: MeteoriteApiServiceProtocol.FetchMeteoritesResult = { result in
            
            switch result {
            case .success(let apiMeteorites):
                
                XCTAssertEqual(apiMeteorites.count, 1000)
                
                let firstMeteorite = apiMeteorites[0]
                
                XCTAssertEqual(firstMeteorite.id, 1)
                XCTAssertEqual(firstMeteorite.name, "Aachen")
                XCTAssertFalse(firstMeteorite.isFavorite)
                XCTAssertEqual(firstMeteorite.mass, 21)
                XCTAssertEqual(firstMeteorite.coordinates.lat, 50.775)
                XCTAssertEqual(firstMeteorite.coordinates.lon, 6.08333)
                
            case .failure(let error):
                XCTFail("Should not return error: \(error)")
            }
            
            exp.fulfill()
        }
        
        sut.fetchMeteorites(completion: response)
        
        wait(for: [exp], timeout: 1)
    }
    
    func test_getFavorites() {
        
        let result = sut.getFavorites()
        
        XCTAssertEqual(result.count, 2)
        
        let resultModel = result[0]
        
        XCTAssertEqual(resultModel.id, 1)
        XCTAssertEqual(resultModel.name, "M1")
        XCTAssertTrue(resultModel.isFavorite)
        XCTAssertEqual(resultModel.mass, 1)
        XCTAssertEqual(resultModel.date, MeteoriteMockGenerator.meteoriteDate)
        XCTAssertEqual(resultModel.coordinates.lat, 1)
        XCTAssertEqual(resultModel.coordinates.lon, 2)
    }
    
    func test_save() {
        
        XCTAssertFalse(spyDbService.objectWasSaved)
        sut.saveFavorite(meteorite: MeteoriteMockGenerator.makeBusinessMeteorite(id: 1))
        XCTAssertTrue(spyDbService.objectWasSaved)
    }
    
    func test_remove() {
        
        XCTAssertFalse(spyDbService.objectWasDeleted)
        sut.removeFavorite(meteorite: MeteoriteMockGenerator.makeBusinessMeteorite(id: 1))
        XCTAssertTrue(spyDbService.objectWasDeleted)
    }
}

private class SpyDbService: MeteoriteDbServiceProtocol {
    
    private(set) var objectWasSaved = false
    private(set) var objectWasDeleted = false
    
    func loadObjects() -> [Meteorite] {
        
        let m1 = MeteoriteMockGenerator.makeBusinessMeteorite(id: 1)
        let m2 = MeteoriteMockGenerator.makeBusinessMeteorite(id: 2)
        
        return [
            m1, m2
        ]
    }
    
    func save(_ object: Meteorite) {
        objectWasSaved = true
    }
    
    func delete(_ object: Meteorite) {
        objectWasDeleted = true
    }
}
