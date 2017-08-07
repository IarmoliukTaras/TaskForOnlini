//
//  NetworkService.swift
//  TaskForOnlini
//
//  Created by 123 on 06.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private init () {}
    
    func getTopNews(complated:@escaping ([News]) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=e0623457e52a48fc9a62d37c175ce93a") else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                guard let jsonDictionary = json as? [String: Any],
                    let articles = jsonDictionary["articles"] as? [[String: Any]] else { return }
                let topNews = articles.map{ News(info: $0) }
                complated(topNews)
                
            } catch let jsonError{
                print(jsonError)
            }
            
        }.resume()
    }
    
    func downloadImage(urlStr: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let err = error {
                print("ERROR:", err)
                return
            }
            guard let data = data else { return }
            completion(data)
        }).resume()
    }
}
