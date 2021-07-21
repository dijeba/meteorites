//
//  MeteoriteDbServiceTests.swift
//  MeteorsFeatureTests
//
//  Created by Diego Jerez Barroso on 21/07/2021.
//

import XCTest
@testable import MeteorsFeature

class MeteoriteDbServiceTests: XCTestCase {
    
    private var userDefaults: UserDefaults!
    private var exampleModel: Meteorite!
    private let meteoriteDate = Date(timeIntervalSince1970: 0)
    private var sut: MeteoriteDbService!

    override func setUp() {
        super.setUp()
        
        exampleModel = Meteorite(id: 1,
                                 name: "M1",
                                 isFavorite: true,
                                 mass: 1,
                                 date: meteoriteDate,
                                 coordinates: (lat: 1, lon: 1))
        
        userDefaults = UserDefaults(suiteName: #file)
        
        sut = MeteoriteDbService(database: userDefaults)
    }
    
    override func tearDown() {
        userDefaults.removePersistentDomain(forName: #file)
        super.tearDown()
    }
    
    func test_saveObject() {
        
        XCTAssertFalse(isPresentExpectedKey())
        
        sut.save(exampleModel)
        
        XCTAssertTrue(isPresentExpectedKey())
    }
    
    func test_loadObjects() {
        
        let expectedEmptyArray = sut.loadObjects()
        XCTAssertEqual(expectedEmptyArray.count, 0)
        
        sut.save(exampleModel)
        
        let result = sut.loadObjects()
        XCTAssertEqual(result.count, 1)
        
        let resultModel = result[0]
        
        XCTAssertEqual(resultModel.id, exampleModel.id)
        XCTAssertEqual(resultModel.name, exampleModel.name)
        XCTAssertEqual(resultModel.isFavorite, exampleModel.isFavorite)
        XCTAssertEqual(resultModel.mass, exampleModel.mass)
        XCTAssertEqual(resultModel.date, exampleModel.date)
        XCTAssertEqual(resultModel.coordinates.lat, exampleModel.coordinates.lat)
        XCTAssertEqual(resultModel.coordinates.lon, exampleModel.coordinates.lon)
    }
    
    func test_deleteObject() {
        
        sut.save(exampleModel)
        XCTAssertTrue(isPresentExpectedKey())
        
        sut.delete(exampleModel)
        
        XCTAssertFalse(isPresentExpectedKey())
    }
    
    private func isPresentExpectedKey() -> Bool {
        let expectedKey = "db-meteorite1"
        return userDefaults.dictionaryRepresentation().keys.filter { $0 == expectedKey }.count == 1
    }
}
