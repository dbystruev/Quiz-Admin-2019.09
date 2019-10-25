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
    static var all: [String] {
        return ["Single", "Multiple", "Ranged"]
    }
    
    var name: String? {
        get { ResponseType.all[rawValue - 1] }
        set {}
    }
    
    var type: Int {
        get {
            return rawValue
        }
        set {
            guard let responseType = ResponseType(rawValue: newValue) else { return }
            self = responseType
        }
    }
}
