//
//  AnimalType.swift
//  Application
//
//  Created by Denis Bystruev on 03/09/2019.
//

import Foundation

enum AnimalType: Int, Codable {
    case dog = 1
    case cat
    case rabbit
    case turtle
    
    var emoji: Character {
        switch self {
        case .dog:
            return "🐶"
        case .cat:
            return "🐱"
        case .rabbit:
            return "🐰"
        case .turtle:
            return "🐢"
        }
    }
}
