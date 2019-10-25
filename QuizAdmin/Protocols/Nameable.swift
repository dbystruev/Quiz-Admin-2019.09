//
//  Quizable.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 20/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import Foundation

protocol Nameable: Codable {
    static var all: [String] { get }
    var name: String? { get set }
    var type: Int { get set }
    var needsUpdate: Bool? { get set }
}

extension Nameable {
    static var all: [String] { [] }
    var needsUpdate: Bool? {
        get { nil }
        set {}
    }
}
