//
//  TodoListVC.swift
//  TaskForOnlini
//
//  Created by 123 on 06.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit
import SQLite

class TodoListVC: UIViewController {
    
    var tasks = [Task]()
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTasksTable()
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add task", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in
            tf.placeholder = "title"
        }
        alert.addTextField { (tf) in
            tf.placeholder = "description"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text, let description = alert.textFields?.last?.text else { return }
            if !title.isEmpty && !description.isEmpty {
                PresistenceService.addTask(title: title, about: description)
                self.reloadTasksTable()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) in

        }
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reloadTasksTable()
    }
    
    fileprivate func reloadTasksTable() {
        self.tasks = PresistenceService.getTasks()
        self.tasksTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toTask",
            let taskVC = segue.destination as? TaskVC,
            let task = sender as AnyObject as? Task
            else { return }
        taskVC.task = task
    }
    
}

extension TodoListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tasksTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell {
            cell.setUpUI(task: tasks[indexPath.row])
            return cell
        } else {
            return TaskTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toTask", sender: self.tasks[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let task = tasks[indexPath.row]
            self.tasks.remove(at: indexPath.row)
            PresistenceService.delete(task: task)
            self.tasksTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

