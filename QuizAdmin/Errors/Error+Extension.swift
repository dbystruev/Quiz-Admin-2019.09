//
//  Error+Extension.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 25.10.2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import Foundation

extension Error {
    func describe() {
        if
            let errors = self as? Errors,
            case .cantDecodeData(let data) = errors,
            let line = String(data: data, encoding: .utf8)
        {
            print(#line, #function, "ERROR:", line)
        } else {
            print(#line, #function, self.localizedDescription)
        }
    }
}
