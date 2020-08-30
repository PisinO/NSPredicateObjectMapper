//
//  POMNumericOperatorTests.swift
//  NSPredicateObjectMapper_Tests
//
//  Created by Ondřej Pišín on 29/08/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import CoreData

@testable import NSPredicateObjectMapper_Example
@testable import NSPredicateObjectMapper

class POMNumericOperatorTests: XCTestCase {

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
    func test_isEqual()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.id).isEqualTo(1).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }

        XCTAssertEqual(cars.count, 1)
    }
    
    func test_isNotEqual_caseInsensitive()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.id).isNotEqualTo(1).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 6)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: LESS
    //  --------------------------------------------------------------------
    func test_isLessThenValue()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.horsepower).isLessThen(70).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 1)
    }
    
    func test_isLessThenOrEqualValue()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.horsepower).isLessOrEqualTo(70).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 2)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: GREATER
    //  --------------------------------------------------------------------
    func test_isGreaterThenValue()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.horsepower).isGreaterThen(70).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 5)
    }
    
    func test_isGreaterThenOrEqualValue()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.horsepower).isGreaterOrEqualTo(70).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 6)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: AND
    //  --------------------------------------------------------------------
    func test_greaterThenAndLessThenValue()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.horsepower).isGreaterThen(70).and.where(\Car.horsepower).isLessThen(90).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 1)
    }
    
    func test_greaterOrEqualThenAndLessOrEqualThenValue()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.horsepower).isGreaterOrEqualTo(70).and.where(\Car.horsepower).isLessOrEqualTo(90).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 3)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: OR
    //  --------------------------------------------------------------------
    func test_greaterThenOrLessThenValue()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.horsepower).isGreaterThen(110).or.where(\Car.horsepower).isLessThen(70).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 2)
    }
    
    func test_greaterOrEqualThenOrLessOrEqualThenValue()
    {
        let fetchRequest = self.fetchRequest
        fetchRequest.predicate = Car.where(\Car.horsepower).isGreaterOrEqualTo(110).or.where(\Car.horsepower).isLessOrEqualTo(70).predicate()
        
        guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
        
        XCTAssertEqual(cars.count, 4)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: IN
    //  --------------------------------------------------------------------
        func test_in() throws
        {
            let fetchRequest = self.fetchRequest
            fetchRequest.predicate = Car.where(\Car.horsepower).in([60, 70, 80]).predicate()
            guard let cars = try? context?.fetch(fetchRequest) else { return XCTFail() }
            let brands = Set(cars.map({ $0.brand }))
            let testResult = Set(["Honda", "BMW", "Audi"])
            
            XCTAssertTrue(testResult.isSubset(of: brands))
        }
    //  --------------------------------------------------------------------
}
