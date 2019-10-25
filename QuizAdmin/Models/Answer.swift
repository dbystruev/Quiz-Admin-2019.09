//
//  Answer.swift
//  Application
//
//  Created by Denis Bystruev on 03/09/2019.
//

import Foundation

struct Answer {
    var id: Int?
    var text: String
    var type: Int
    var questionId: Int?
    var needsUpdate: Bool?
}

extension Answer: Nameable {
    var name: String? {
        get { text }
        set {
            if let newText = newValue {
                text = newText
            }
        }
    }
}
