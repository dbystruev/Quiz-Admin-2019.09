//
//  CellManager.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 17/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class CellManager: NSObject {
    func identifier(for item: Nameable, sender: QuizableTableViewController) -> String? {
        if item is Answer {
            return "AnswerCell"
        } else if item is Question {
            return sender.isEditing ? "QuestionEditingCell" : "QuestionCell"
        } else {
            return nil
        }
    }
    
    func configure(
        _ cell: UITableViewCell,
        for indexPath: IndexPath,
        with answer: Answer,
        sender: QuizableTableViewController
    ) {
        cell.textLabel?.text = answer.text
        cell.detailTextLabel?.text = "Type: \(answer.type)"
    }
    
    func configure(
        _ cell: UITableViewCell,
        for indexPath: IndexPath,
        with question: Question,
        sender: QuizableTableViewController
    ) {
        if sender.isEditing {
            guard let questionEditingCell = cell as? QuestionEditingCell else { return }
            questionEditingCell.textField.text = question.text
            
            let picker = questionEditingCell.picker
            picker?.dataSource = self
            picker?.delegate = sender
            picker?.indexPath = indexPath
            picker?.selectRow(question.type - 1, inComponent: 0, animated: true)
        } else {
            cell.textLabel?.text = question.text
            guard let name = ResponseType(rawValue: question.type)?.name else { return }
            cell.detailTextLabel?.text = "Type: \(name)"
        }
    }
    
    func configure(
        _ cell: UITableViewCell,
        for indexPath: IndexPath,
        with item: Nameable,
        sender: QuizableTableViewController
    ) {
        if let answer = item as? Answer {
            configure(cell, for: indexPath, with: answer, sender: sender)
        } else if let question = item as? Question {
            configure(cell, for: indexPath, with: question, sender: sender)
        }
    }
    
    func height(sender: QuizableTableViewController) -> CGFloat {
        if sender.isEditing {
            return 44 * CGFloat(ResponseType.all.count) + 8 + 34
        }
        return UITableView.automaticDimension
    }
}

// MARK: - UIPickerViewDataSource
extension CellManager: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ResponseType.all.count
    }
}
