//
//  News.swift
//  TaskForOnlini
//
//  Created by 123 on 06.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation

class News {
    let title: String
    let imageUrl: String
    let author: String
    let description: String
    let date: String
    
    init(info dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.imageUrl = dictionary["urlToImage"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.date = dictionary["publishedAt"] as? String ?? ""
    }
}
