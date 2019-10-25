//
//  Errors.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 25.10.2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import Foundation

enum Errors: Swift.Error {
    case cantDecodeData(Data)
    case idShouldNotBeNil
    
    var description: String {
        switch self {
        case .cantDecodeData(let data):
            return "Can't decode data \(data)"
        case .idShouldNotBeNil:
            return "ID should not be nil"
        }
    }
}
