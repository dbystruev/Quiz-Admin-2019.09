//
//  CellManager.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 17/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class CellManager {
    func identifier(for item: Nameable, sender: QuizableTableViewController) -> String? {
        if item is Answer {
            return "AnswerCell"
        } else if item is Question {
            return sender.isEditing ? "QuestionEditingCell" : "QuestionCell"
        } else {
            return nil
        }
    }
    
    func configure(_ cell: UITableViewCell, with answer: Answer, sender: QuizableTableViewController) {
        cell.textLabel?.text = answer.text
        cell.detailTextLabel?.text = "Type: \(answer.type)"
    }
    
    func configure(_ cell: UITableViewCell, with question: Question, sender: QuizableTableViewController) {
        if sender.isEditing {
            guard let questionEditingCell = cell as? QuestionEditingCell else { return }
            
        } else {
            cell.textLabel?.text = question.text
            cell.detailTextLabel?.text = "Type: \(question.type)"
        }
    }
    
    func configure(_ cell: UITableViewCell, with item: Nameable, sender: QuizableTableViewController) {
        if let answer = item as? Answer {
            configure(cell, with: answer, sender: sender)
        } else if let question = item as? Question {
            configure(cell, with: question, sender: sender)
        }
    }
}
