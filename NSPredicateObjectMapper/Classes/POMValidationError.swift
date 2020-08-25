//
//  POMValidationError.swift
//  POM
//
//  Created by Ondřej Pišín on 26/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation

public enum POMValidationError: Error
{
    case wrongSequence(String)
    case wrongTypeToCompare(String)
    case general(Error)
}
