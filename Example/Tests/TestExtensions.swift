//
//  TestExtensions.swift
//  POMTesterTests
//
//  Created by Ondřej Pišín on 25/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData
import XCTest

@testable import NSPredicateObjectMapper_Example
@testable import NSPredicateObjectMapper

extension NSManagedObjectContext {
    
    class func contextForTests() throws -> NSManagedObjectContext {
        // Get the model
        let model = NSManagedObjectModel.mergedModel(from: Bundle.allBundles)
        
        XCTAssertNotNil(model)
        
        // Create and configure the coordinator
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model!)
        try coordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        
        // Setup the context
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator

        try context.prepareDatabase()
        
        return context
    }
 
    class var brands: [String]
    {
        return ["Honda", "BMW", "Audi", "Skoda", "MB", "Seat", "Suzuki"]
    }
    
    private func seed()
    {
        let yearSeconds: Double = 31556926
        
        let owner = NSEntityDescription.insertNewObject(forEntityName: "\(Owner.self)", into: self) as! Owner
        owner.id = 1
        owner.name = "John Doe"
        
        for (index, brand) in Self.brands.enumerated()
        {
            let car = NSEntityDescription.insertNewObject(forEntityName: "\(Car.self)", into: self) as! Car
            car.brand = brand
            car.id = Int32(index+1)
            car.productionDate = Date().addingTimeInterval(-(yearSeconds * Double.random(in: 0...30)))
            car.horsepower = Int32(60 + index * 10)
            car.accessories = ["ABS", "LED lights", "Roof rack"]
            car.transmissionRatios = [3.26, 2.4, 1.8]
            car.uuid = UUID()
            car.link = URL(string: "https://backend.com/api/\(car.uuid)")
            car.data = car.uuid.uuidString.data(using: .utf8)
            car.isAvailable = false
            
            if index == 0 {
                car.accessories?.append("Spare wheel")
                car.isAvailable = true
            }
            
            owner.addToCars(car)
        }
        
        do
        {
            try save()
        }
        catch let error as NSError
        {
            XCTFail("ERROR: \(error), \(error.userInfo)")
        }
    }
    
    func prepareDatabase() throws
    {
        // EDIT: Test db is in-memory only, so no need for clean
        // Clean database
//        for car in (try? fetch(Car.fetchRequest())) as? [NSManagedObject] ?? []
//        {
//            delete(car)
//        }
        
        seed()
        
        try save()
    }
}
