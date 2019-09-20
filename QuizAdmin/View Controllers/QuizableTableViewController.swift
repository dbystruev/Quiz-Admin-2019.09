//
//  QuizableTableViewController.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 20/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class QuizableTableViewController: UITableViewController {
    let cellManager = CellManager()
    let answersNetworkManager = NetworkManager<Answer>("http://server.getoutfit.ru:8080/answers")!
    let questionsNetworkManager = NetworkManager<Question>("http://server.getoutfit.ru:8080/questions")!
    
    var items = [Nameable]()
    
    // MARK: - UIViewController Methods
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let completion: (Codable?, Error?) -> Void = { items, error in
            guard let items = items as? [Nameable] else { return }
            self.items = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.leftBarButtonItem = self.editButtonItem
            }
        }
        
        if restorationIdentifier == "AnswersId" {
            answersNetworkManager.getAll(completion: completion)
        } else if restorationIdentifier == "QuestionsId" {
            questionsNetworkManager.getAll(completion: completion)
        }
    }
}

// MARK: - UITableViewDataSource
extension QuizableTableViewController/*: UITableViewDataSource */ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        guard let id = cellManager.identifier(for: item, sender: self) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id) else { return UITableViewCell() }
        cellManager.configure(cell, with: item, sender: self)
        return cell
    }
}