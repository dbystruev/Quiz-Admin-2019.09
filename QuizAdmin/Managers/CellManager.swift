//
//  CellManager.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 17/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class CellManager {
    func configure(_ cell: UITableViewCell, with answer: Answer) {
        cell.textLabel?.text = answer.text
        cell.detailTextLabel?.text = "\(answer.type)"
    }
    
    func configure(_ cell: UITableViewCell, with question: Question) {
        cell.textLabel?.text = question.text
        cell.detailTextLabel?.text = "\(question.type)"
    }
}
