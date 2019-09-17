//
//  QuestionsTableViewController.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 17/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController {
    let cellManager = CellManager()
    let networkManager = NetworkManager<Question>("http://server.getoutfit.ru:8080/questions")!
    
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getAll { questions, error in
            guard let questions = questions as? [Question] else { return }
            self.questions = questions
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension QuestionsTableViewController/*: UITableViewDataSource */ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        let question = questions[indexPath.row]
        cellManager.configure(cell, with: question)
        return cell
    }
}
