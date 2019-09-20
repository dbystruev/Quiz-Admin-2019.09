//
//  ResponseType.swift
//  Application
//
//  Created by Denis Bystruev on 03/09/2019.
//

enum ResponseType: Int {
    case single = 1
    case multiple
    case ranged
}

extension ResponseType: Nameable {
    var name: String? {
        switch self {
        case .single:
            return "Single"
        case .multiple:
            return "Multiple"
        case .ranged:
            return "Ranged"
        }
    }
}
