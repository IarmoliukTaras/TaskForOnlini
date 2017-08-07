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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toDetails",
            let detailsVC = segue.destination as? NewsDetailsVC,
            let news = sender as AnyObject as? News
            else { return }
        detailsVC.news = news
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
        if let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell {
            cell.updateUI(news: topNews[indexPath.row])
            return cell
        } else {
            return NewsTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: self.topNews[indexPath.row])
    }
    
}

