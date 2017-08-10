//
//  NewsCellTableViewCell.swift
//  TaskForOnlini
//
//  Created by 123 on 06.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: NewsImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    func updateUI(news: News) {
        self.newsTitle.text = news.title
        self.newsImageView.loadUsingCacheWith(url: news.imageUrl)
    }

}
