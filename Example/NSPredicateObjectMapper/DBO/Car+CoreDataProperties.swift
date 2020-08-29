//
//  Car+CoreDataProperties.swift
//  NSPredicateObjectMapper_Example
//
//  Created by Ondřej Pišín on 25/08/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }
    
    @NSManaged public var brand: String
    @NSManaged public var data: Data?
    @NSManaged public var horsepower: Int32
    @NSManaged public var id: Int32
    @NSManaged public var link: URL?
    @NSManaged public var uuid: UUID
    @NSManaged public var productionDate: Date?
    @NSManaged public var accessories: [String]?
    @NSManaged public var transmissionRatios: [Double]?
}
