//
//  AnswersTableViewController.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 17/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class AnswersTableViewController: UITableViewController {
    let cellManager = CellManager()
    let networkManager = NetworkManager<Answer>("http://server.getoutfit.ru:8080/answers")!
    
    var answers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getAll { answers, error in
            guard let answers = answers as? [Answer] else { return }
            self.answers = answers
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension AnswersTableViewController/*: UITableViewDataSource */ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
        let answer = answers[indexPath.row]
        cellManager.configure(cell, with: answer)
        return cell
    }
}
