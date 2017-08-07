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
        self.newsTitle.text = news.title
        self.imageView.loadUsingCacheWith(url: news.imageUrl)
        self.newsDescription.text = news.description
        self.dateLabel.text = news.date
        self.authorLabel.text = news.author
    }
    
    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: "toTopNews", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
