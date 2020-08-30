//
//  Owner+CoreDataProperties.swift
//  NSPredicateObjectMapper_Example
//
//  Created by Ondřej Pišín on 25/08/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
//

import Foundation
import CoreData


extension Owner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Owner> {
        return NSFetchRequest<Owner>(entityName: "Owner")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var cars: NSSet?

}

// MARK: Generated accessors for cars
extension Owner {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: Car)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: Car)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}
