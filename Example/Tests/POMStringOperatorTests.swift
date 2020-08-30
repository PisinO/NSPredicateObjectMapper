//
//  POMTesterTests.swift
//  POMTesterTests
//
//  Created by Ondřej Pišín on 29/05/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import XCTest
import CoreData

@testable import NSPredicateObjectMapper

class POMStringOperatorTests: XCTestCase
{
    private var context: NSManagedObjectContext?
    private var fetchRequest: NSFetchRequest<Car>
    {
        return Car.fetchRequest()
    }

    override func setUpWithError() throws
    {
        context = try NSManagedObjectContext.contextForTests()
    }

    //  --------------------------------------------------------------------
    //  MARK: EQUALS
    //  --------------------------------------------------------------------
    func test_isEqual() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).isEqualTo("Skoda").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }

        XCTAssertEqual(cars.count, 1)
    }
    
    func test_isNotEqual_caseInsensitive() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).isNotEqualTo("Skoda").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 6)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: BEGINSWITH
    //  --------------------------------------------------------------------
    func test_beginsWith_caseInsensitive() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).beginsWith("s", caseInsensitive: true).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        let brands = Set(cars.map({ $0.brand }))
        let testResult = Set(["Skoda", "Suzuki", "Seat"])
        
        XCTAssertTrue(testResult.isSubset(of: brands))
    }
    
    func test_beginsWith_caseSensitive_shouldReturnEmptyArray() throws
    {
         let fetchRequest = self.fetchRequest
         fetchRequest.predicate = Car.where(\Car.brand).beginsWith("s").predicate()
         
         guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
         
        XCTAssertEqual(cars.count, 0)
     }
    
    func test_beginsWith_caseSensitive() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).beginsWith("S").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        let brands = Set(cars.map({ $0.brand }))
        let testResult = Set(["Skoda", "Suzuki", "Seat"])
        
        XCTAssertTrue(testResult.isSubset(of: brands))
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: CONTAINS
    //  --------------------------------------------------------------------
    func test_contains_caseSensitive() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).contains("da").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        let brands = Set(cars.map({ $0.brand }))
        let testResult = Set(["Skoda", "Honda"])
        
        XCTAssertTrue(testResult.isSubset(of: brands))
    }
    
    func test_contains_caseSensitive_shouldReturnEmptyArray() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).contains("dA").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }

        XCTAssertEqual(cars.count, 0)
    }
    
    func test_contains_caseInsensitive() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).contains("dA", caseInsensitive: true).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        let brands = Set(cars.map({ $0.brand }))
        let testResult = Set(["Skoda", "Honda"])
        
        XCTAssertTrue(testResult.isSubset(of: brands))
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: ENDSWITH
    //  --------------------------------------------------------------------
    func test_endsWith_caseInsensitive() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).endsWith("A", caseInsensitive: true).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        let brands = Set(cars.map({ $0.brand }))
        let testResult = Set(["Skoda", "Honda"])
        
        XCTAssertTrue(testResult.isSubset(of: brands))
    }
    
    func test_endsWith_caseSensitive_shouldReturnEmptyArray() throws
    {
         let fetchRequest = self.fetchRequest
         fetchRequest.predicate = Car.where(\Car.brand).endsWith("A").predicate()
         
         guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
         
        XCTAssertEqual(cars.count, 0)
     }
    
    func test_endsWith_caseSensitive() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).endsWith("a").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        let brands = Set(cars.map({ $0.brand }))
        let testResult = Set(["Skoda", "Honda"])
        
        XCTAssertTrue(testResult.isSubset(of: brands))
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: IN
    //  --------------------------------------------------------------------
    func test_in() throws
    {
        let fetchRequest = self.fetchRequest
//        Car.where(\Car.transmissionRatios).
        fetchRequest.predicate = Car.where(\Car.brand).in(["Skoda", "BMW", "MB"]).predicate()
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        let brands = Set(cars.map({ $0.brand }))
        let testResult = Set(["Skoda", "BMW", "MB"])
        
        XCTAssertTrue(testResult.isSubset(of: brands))
    }
    
    func test_in_shouldReturnEmptyArray() throws
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.brand).in(["Skoda1"]).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 0)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: Array operators
    //  --------------------------------------------------------------------
    
    func test_index_isEqualToValue() {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.accessories).elementAt(1, equalsTo: "LED lights").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 7)
    }
    
    func test_first_isEqualToValue() {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.accessories).first(equalsTo: "ABS").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 7)
    }
    
    func test_last_isEqualToValue() {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.accessories).last(equalsTo: "Roof rack").predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 6)
    }
    
    func test_size_isEqualToValue() {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.accessories).size(equalsTo: 4).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 1)
    }
}
