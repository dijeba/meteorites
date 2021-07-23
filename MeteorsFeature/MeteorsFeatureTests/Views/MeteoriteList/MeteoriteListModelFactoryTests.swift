//
//  MeteoriteListModelFactoryTests.swift
//  MeteorsFeatureTests
//
//  Created by Diego Jerez Barroso on 23/07/2021.
//

import XCTest
@testable import MeteorsFeature

class MeteoriteListModelFactoryTests: XCTestCase {
    
    private var sut: MeteoriteListModelFactory!
    
    override func setUp() {
        super.setUp()
        sut = MeteoriteListModelFactory()
    }
    
    func test_makeDefaultModel_for_notFavoriteScreen() {
        
        let result = sut.makeDefaultModel(isFavoriteScreen: false)
        
        XCTAssertEqual(result.title, Constants.MeteoriteList.title)
        XCTAssertEqual(result.cells.count, 0)
    }
    
    func test_makeDefaultModel_for_favoriteScreen() {
        
        let result = sut.makeDefaultModel(isFavoriteScreen: true)
        
        XCTAssertEqual(result.title, Constants.MeteoriteList.titleFavorites)
        XCTAssertEqual(result.cells.count, 0)
    }
    
    func test_makeModel_for_notFavoriteScreen() {
        
        let meteorites = [
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 1, isFavorite: false),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 2, isFavorite: true)
        ]
        
        let result = sut.makeModel(meteorites: meteorites, isFavoriteScreen: false)
        
        XCTAssertEqual(result.title, Constants.MeteoriteList.title)
        XCTAssertEqual(result.cells.count, 2)
        
        XCTAssertEqual(result.cells[0].modelId, 1)
        XCTAssertEqual(result.cells[0].name, "M1")
        XCTAssertEqual(result.cells[0].yearTitle, Constants.MeteoriteCell.yearTitle)
        XCTAssertEqual(result.cells[0].massTitle, Constants.MeteoriteCell.massTitle)
        XCTAssertEqual(result.cells[0].mass, "1g")
        XCTAssertFalse(result.cells[0].isFavorite)
        
        XCTAssertEqual(result.cells[1].modelId, 2)
        XCTAssertEqual(result.cells[1].name, "M2")
        XCTAssertEqual(result.cells[1].yearTitle, Constants.MeteoriteCell.yearTitle)
        XCTAssertEqual(result.cells[1].massTitle, Constants.MeteoriteCell.massTitle)
        XCTAssertEqual(result.cells[1].mass, "1g")
        XCTAssertTrue(result.cells[1].isFavorite)
    }
    
    func test_makeModel_for_favoriteScreen() {
        
        let meteorites = [
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 1, isFavorite: false),
            MeteoriteMockGenerator.makeBusinessMeteorite(id: 2, isFavorite: false)
        ]
        
        let result = sut.makeModel(meteorites: meteorites, isFavoriteScreen: true)
        
        XCTAssertEqual(result.title, Constants.MeteoriteList.titleFavorites)
        XCTAssertEqual(result.cells.count, 2)
        
        XCTAssertEqual(result.cells[0].modelId, 1)
        XCTAssertEqual(result.cells[0].name, "M1")
        XCTAssertEqual(result.cells[0].yearTitle, Constants.MeteoriteCell.yearTitle)
        XCTAssertEqual(result.cells[0].massTitle, Constants.MeteoriteCell.massTitle)
        XCTAssertEqual(result.cells[0].mass, "1g")
        XCTAssertTrue(result.cells[0].isFavorite)
        
        XCTAssertEqual(result.cells[1].modelId, 2)
        XCTAssertEqual(result.cells[1].name, "M2")
        XCTAssertEqual(result.cells[1].yearTitle, Constants.MeteoriteCell.yearTitle)
        XCTAssertEqual(result.cells[1].massTitle, Constants.MeteoriteCell.massTitle)
        XCTAssertEqual(result.cells[1].mass, "1g")
        XCTAssertTrue(result.cells[1].isFavorite)
    }
}
