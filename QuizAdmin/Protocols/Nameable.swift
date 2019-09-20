//
//  Quizable.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 20/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import Foundation

protocol Nameable: Codable {
    var name: String? { get }
}
