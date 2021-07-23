//
//  MeteoriteListViewModelTests.swift
//  MeteorsFeatureTests
//
//  Created by Diego Jerez Barroso on 23/07/2021.
//

import XCTest
@testable import MeteorsFeature

class MeteoriteListViewModelTests: XCTestCase {
    
    private var sut: MeteoriteListViewModel!
    
    override func tearDown() {
        sut = nil
    }
    
    func test_download_classifies_downloadedAndFavs_correctly() {
        
        let exp = expectation(description: "meteoriteListViewModelTests_response_exp_1")
        let mockManager = MockMeteoriteListManager(expectation: exp)
        
        sut = MeteoriteListViewModel(isFavoriteScreen: false, manager: mockManager)
        
        waitForExpectations(timeout: 2) { _ in
            
            let result = self.sut.data
            
            XCTAssertTrue(result.cells[0].isFavorite)
            XCTAssertTrue(result.cells[1].isFavorite)
            XCTAssertTrue(result.cells[2].isFavorite)
            
            XCTAssertFalse(result.cells[3].isFavorite)
            XCTAssertFalse(result.cells[4].isFavorite)
            XCTAssertFalse(result.cells[5].isFavorite)
        }
    }
    
    func test_favoriteScreen_shows_favs() {
        
        let mockManager = MockMeteoriteListManager(expectation: nil)
        sut = MeteoriteListViewModel(isFavoriteScreen: true, manager: mockManager)
        
        let data = sut.data
        
        XCTAssertEqual(data.cells.count, 3)
        
        XCTAssertTrue(data.cells[0].isFavorite)
        XCTAssertTrue(data.cells[1].isFavorite)
        XCTAssertTrue(data.cells[2].isFavorite)
    }
    
    func test_getMeteorite() {
        
        let mockManager = MockMeteoriteListManager(expectation: nil)
        
        sut = MeteoriteListViewModel(isFavoriteScreen: true, manager: mockManager)
        
        let meteorite1 = sut.getMeteorite(id: 1)
        
        XCTAssertEqual(meteorite1.id, 1)
        XCTAssertTrue(meteorite1.isFavorite)
        
        let meteorite6 = sut.getMeteorite(id: 6)
        
        XCTAssertEqual(meteorite6.id, 6)
        XCTAssertFalse(meteorite6.isFavorite)
    }
}

class MockMeteoriteListManager: MeteoriteListManagerProtocol {
    
    let expectation: XCTestExpectation?
    
    init(expectation: XCTestExpectation?) {
        self.expectation = expectation
    }
    
    let apiService: MeteoriteApiServiceProtocol = MeteoriteApiService()
    let dbService: MeteoriteDbServiceProtocol = MeteoriteDbService()
    
    func fetchMeteorites(completion: @escaping (ServiceResult<[Meteorite]>) -> Void) {
        
        let meteorites = [
            createMeteorites(id: 1, fav: true),
            createMeteorites(id: 2, fav: true),
            createMeteorites(id: 3, fav: true),
            createMeteorites(id: 4, fav: false),
            createMeteorites(id: 5, fav: false),
            createMeteorites(id: 6, fav: false)
        ]
        
        completion(.success(meteorites))
        expectation?.fulfill()
    }
    
    func getFavorites() -> [Meteorite] {
        return [
            createMeteorites(id: 1, fav: true),
            createMeteorites(id: 2, fav: true),
            createMeteorites(id: 3, fav: true)
        ]
    }
    
    func saveFavorite(meteorite: Meteorite) {
    }
    
    func removeFavorite(meteorite: Meteorite) {
    }
    
    func createMeteorites(id: Int, fav: Bool) -> Meteorite {
        
        Meteorite(
            id: id,
            name: "aMeteorite",
            isFavorite: fav,
            mass: 0,
            date: Date(),
            coordinates: (lat: 0, lon: 0)
        )
    }
}

