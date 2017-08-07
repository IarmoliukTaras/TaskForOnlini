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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(news: News) {
        self.newsTitle.text = news.title
        self.newsImageView.loadUsingCacheWith(url: news.imageUrl)
    }

}
