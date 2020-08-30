//
//  POMOtherOperatorTests.swift
//  NSPredicateObjectMapper_Tests
//
//  Created by Ondřej Pišín on 29/08/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import CoreData

@testable import NSPredicateObjectMapper_Example
@testable import NSPredicateObjectMapper

class POMOtherOperatorTests: XCTestCase {

    private var context: NSManagedObjectContext?
    private var fetchRequest: NSFetchRequest<Car>
    {
        return Car.fetchRequest()
    }

    override func setUpWithError() throws
    {
        context = try NSManagedObjectContext.contextForTests()
    }
    
    func test_bool() {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.isAvailable).isEqualTo(true).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }

        XCTAssertEqual(cars.count, 1)
        XCTAssertEqual(cars[0].brand, "Honda")
    }
    
    func test_uuid() {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).isEqualTo("Skoda").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }

        XCTAssertEqual(cars.count, 1)
        
        let uuid = cars[0].uuid
        
        fetchRequest.predicate = Car.where(\Car.uuid).isEqualTo(uuid).predicate()
        
        guard let carsUUID = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(carsUUID.count, 1)
        XCTAssertEqual(carsUUID[0], cars[0])
    }
    
    func test_url() {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).isEqualTo("Skoda").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }

        XCTAssertEqual(cars.count, 1)
        
        let uuid = cars[0].uuid.uuidString
        
        fetchRequest.predicate = Car.where(\Car.link).isEqualTo(URL(string: "https://backend.com/api/\(uuid)")).predicate()
        
        guard let carsUUID = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(carsUUID.count, 1)
        XCTAssertEqual(carsUUID[0], cars[0])
    }
}
