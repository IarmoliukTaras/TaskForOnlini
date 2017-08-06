//
//  TopNewsVC.swift
//  TaskForOnlini
//
//  Created by 123 on 06.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class TopNewsVC: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    
    var topNews = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.shared.getTopNews { (topNews) in
            self.topNews = topNews
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TopNewsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        cell.textLabel?.text = self.topNews[indexPath.row].title
        return cell
    }
}

