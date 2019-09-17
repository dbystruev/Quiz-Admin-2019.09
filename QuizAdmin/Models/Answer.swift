//
//  Answer.swift
//  Application
//
//  Created by Denis Bystruev on 03/09/2019.
//

import Foundation

struct Answer: Codable {
    var id: Int?
    var text: String
    var type: Int
    var questionId: Int?
}
