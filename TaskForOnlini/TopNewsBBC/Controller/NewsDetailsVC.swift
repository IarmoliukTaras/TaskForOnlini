//
//  NewsDetailsVC.swift
//  TaskForOnlini
//
//  Created by 123 on 06.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class NewsDetailsVC: UIViewController {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newsDescription: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    var news: News!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    fileprivate func updateUI() {
        self.newsTitle.text       = news.title
        self.newsDescription.text = news.description
        self.dateLabel.text       = news.date
        self.authorLabel.text     = news.author
        self.imageView.loadUsingCacheWith(url: news.imageUrl)
    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

