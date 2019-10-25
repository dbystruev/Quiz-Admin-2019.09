//
//  Question.swift
//  Application
//
//  Created by Denis Bystruev on 03/09/2019.
//

import Foundation

struct Question {
    var id: Int?
    var text: String
    var type: Int
    var needsUpdate: Bool?
}

extension Question: Nameable {
    var name: String? {
        get { text }
        set {
            if let newText = newValue {
                text = newText
            }
        }
    }
}
