//
//  POMValidator.swift
//  POM
//
//  Created by Ondřej Pišín on 30/05/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation

final class POMValidator
{
    static func validate(requestVector: [POMObject], request: POMObject) throws
    {
        //  MARK: POMProperty
        //  --------------------------------------------------------------------
        if request is POMProperty
        {
            //  [property]; [..., operator, property]
            //  --------------------------------------------------------------------
            if requestVector.any() && !(requestVector.last! is POMOperator)
            {
                throw POMValidationError.wrongSequence("")
            }
        }
        //  --------------------------------------------------------------------
        
        
        
        //  MARK: POMOperator
        //  --------------------------------------------------------------------
        if request is POMOperator
        {
            //  [property]
            //  --------------------------------------------------------------------
            if !requestVector.any()
            {
                throw POMValidationError.wrongSequence("")
            }
            
            //  [..., property, operator]
            //  --------------------------------------------------------------------
            if (requestVector.last! is POMOperator)
            {
                throw POMValidationError.wrongSequence("")
            }
        }
        //  --------------------------------------------------------------------
        
        
        
        //  MARK: POMValue
        //  --------------------------------------------------------------------
        if let value = request as? POMValue
        {
            //  [property]
            //  --------------------------------------------------------------------
            if !requestVector.any()
            {
                throw POMValidationError.wrongSequence("")
            }
            
            //  [..., operator, value]
            //  --------------------------------------------------------------------
            if !(requestVector.last! is POMOperator)
            {
                throw POMValidationError.wrongSequence("")
            }
            
            //  property.type == value.type
            //  --------------------------------------------------------------------
            let toReplace = ["8", "16", "32", "64", "Array", "Optional", "<", ">"]
            let propertyType = requestVector.lastObject(ofType: POMProperty.self)!.type.prettyType(replacing: toReplace)
            let valueType = value.type.prettyType(replacing: toReplace)
            
            if propertyType != valueType
            {
                throw POMValidationError.wrongTypeToCompare("")
            }
        }
        //  --------------------------------------------------------------------
    }
}
