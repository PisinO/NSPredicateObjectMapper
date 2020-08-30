//
//  POMValidatorTests.swift
//  POMTesterTests
//
//  Created by Ondřej Pišín on 25/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import XCTest

@testable import NSPredicateObjectMapper

class POMValidatorTests: XCTestCase {

    override func setUpWithError() throws
    {
        
    }
    
    //  --------------------------------------------------------------------
    //  MARK: POMProperty
    //  --------------------------------------------------------------------
    func test_stringPropertyValidation_stringValueShouldBeCorrect()
    {
        do
        {
            try Car.where(\Car.brand).isEqualTo("Skoda").context.validate()
        }
        catch
        {
            XCTFail()
        }
    }
    
    func test_stringPropertyValidation_intValueShouldBeCorrect()
    {
        do
        {
            try Car.where(\Car.brand).isEqualTo(1).context.validate()
            XCTFail()
        }
        catch
        {
            
        }
    }
    
    func test_stringPredicateValidation_intValueShouldBeCorrect()
    {
        do
        {
            let _ = try Car.where(\Car.brand).isEqualTo(1).predicateWithValidation()
            XCTFail()
        }
        catch
        {
            
        }
    }
}
