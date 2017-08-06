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
    
    init(info dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.imageUrl = dictionary["urlToImage"] as? String ?? ""
    }
}
