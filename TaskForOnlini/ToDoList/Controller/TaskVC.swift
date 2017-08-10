//
//  AddTaskVC.swift
//  TaskForOnlini
//
//  Created by 123 on 07.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class TaskVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var task: Task!
    var editMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTextField.text = task.title
        self.descriptionTextView.text = task.description
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editPressed(_ sender: UIButton) {
        if editMode == true {
            self.titleTextField.isUserInteractionEnabled = false
            self.titleTextField.backgroundColor = UIColor.clear
            self.descriptionTextView.isUserInteractionEnabled = false
            self.descriptionTextView.backgroundColor = UIColor.clear
            guard let title = self.titleTextField.text,
                let description = self.descriptionTextView.text
                else { return }
            SQLiteService.shared.editTask(id: self.task.id, title: title, description: description)
            sender.setTitle("EDIT", for: .normal)
            editMode = false
        } else {
            self.titleTextField.isUserInteractionEnabled = true
            self.titleTextField.backgroundColor = UIColor.lightGray
            self.descriptionTextView.isUserInteractionEnabled = true
            self.descriptionTextView.backgroundColor = UIColor.lightGray
            sender.setTitle("SAVE", for: .normal)
            editMode = true
        }
    }
}
