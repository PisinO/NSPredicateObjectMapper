//
//  POMValidatorTests.swift
//  POMTesterTests
//
//  Created by Ondřej Pišín on 25/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import XCTest

@testable import NSPredicateObjectMapper_Example
@testable import NSPredicateObjectMapper

class POMValidatorTests: XCTestCase {

    override func setUpWithError() throws
    {
        
    }
    
    //  --------------------------------------------------------------------
    //  MARK: POMProperty
    //  --------------------------------------------------------------------
    func test_CDWStringPropertyValidation_stringValue_shouldBeCorrect()
    {
        do
        {
            try Car.where(\Car.brand).isEqualTo("Skoda").context.validate()
        }
        catch
        {
            assertionFailure()
        }
    }
    
    func test_CDWStringPropertyValidation_intValue_shouldBeCorrect()
    {
        do
        {
            try Car.where(\Car.brand).isEqualTo(1).context.validate()
            assertionFailure()
        }
        catch
        {
            
        }
    }
}
