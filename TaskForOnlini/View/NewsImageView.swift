//
//  NewsImageView.swift
//  TaskForOnlini
//
//  Created by 123 on 06.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class NewsImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
        self.contentMode = .scaleAspectFill
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.size.width / 2
        clipsToBounds = true
    }

}


extension UIImageView {
    func loadUsingCacheWith(url: String) {
        self.image = nil
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            self.image = cachedImage
            return
        }
        NetworkService.shared.downloadImage(urlStr: url) { (data) in
            DispatchQueue.main.async {
                guard let downloadedImage = UIImage(data: data) else { return }
                imageCache.setObject(downloadedImage, forKey: url as NSString)
                self.image = downloadedImage
                
            }
        }
    }
}
