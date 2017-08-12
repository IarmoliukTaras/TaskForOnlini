//
//  TaskTableViewCell.swift
//  TaskForOnlini
//
//  Created by 123 on 09.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var task: Task!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = .right
        self.addGestureRecognizer(leftSwipe)
    }
    
    func setUpUI(task: Task) {
        self.task = task
        self.titleLabel.text = task.title
        self.dateLabel.text  = task.date
        
        if task.status == STATUS_COMPLETED {
            crossText()
        } else {
            uncrossText()
        }
    }
    
    fileprivate func crossText() {
        self.titleLabel.crossText()
        self.dateLabel.crossText()
    }
    
    fileprivate func uncrossText() {
        self.titleLabel.uncrossText()
        self.dateLabel.uncrossText()
    }

}

extension TaskTableViewCell {
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            task.status = STATUS_COMPLETED
            PresistenceService.saveContext()
            crossText()
        default:
            break
        }
    }
}

extension UILabel {
    func crossText() {
        guard let text = self.text else { return }
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        self.attributedText = attributeString
    }
    
    func uncrossText() {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}
