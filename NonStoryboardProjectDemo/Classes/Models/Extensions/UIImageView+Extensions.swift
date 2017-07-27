//
//  UIImageView+Extensions.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/11.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit
import AlamofireImage
import Nuke
//import NukeAlamofirePlugin
import Kingfisher
import SDWebImage

extension UIImageView {
    
    /// URLからUIImageViewを生成する(iOS Default)
    /// - parameter url: URL型
    func setImageByDefault(with url: URL) {
        let start = NSDate()
//        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if error == nil, case .some(let result) = data, let image = UIImage(data: result) {
                self?.image = image
                
                let elapsed = NSDate().timeIntervalSince(start as Date)
                print(elapsed)
                
            } else {
                // デフォルトのイメージセット

            }
        }.resume()
    }

    /// URLからUIImageViewを生成する(AlamofireImage)
    /// - parameter url: URL型
    @discardableResult
    func setImageByAlamofire(with url: URL) {
        let start = NSDate()
        
        let request = URLRequest(url: url)
        af_setImage(withURLRequest: request, imageTransition: .flipFromTop(1)) { [weak self] response in
        
//        af_setImage(withURL: url) { [weak self] response in
            switch response.result {
            case .success(let result):
                self?.image = result
                
                let elapsed = NSDate().timeIntervalSince(start as Date)
                print(elapsed)
                
            case .failure(_):
                // デフォルトのイメージセット
                break
            }
        
        }
    }

    /// URLからUIImageViewを生成する(Nuke)
    /// - parameter url: URL型
    func setImageByNuke(with url: URL) {
        let start = NSDate()
        
        let request = Request(url: url)
        Nuke.Manager.shared.loadImage(with: request, into: self) { [weak self] response, isResponse in
        
//        Nuke.Manager.shared.loadImage(with: url, into: self) { [weak self] response, isResponse in
            if isResponse, case .success(let result) = response {
                self?.image = result
                
                let elapsed = NSDate().timeIntervalSince(start as Date)
                print(elapsed)
                
            } else {
                // デフォルトのイメージセット
            }
            
        }
    }
    
    /// URLからUIImageViewを生成する(Kingfisher)
    /// - parameter urlString: URL(string型)
//    func setImageByKingfisher(with url: URL, placeholder: UIImage, completion: @escaping (UIImage) -> Void) {
    func setImageByKingfisher(with url: URL) {
        
        let start = NSDate()
        
        self.kf.setImage(with: url) { [weak self] image, error, _, _ in
            
            // Success
            if error == nil, let image = image {
                self?.image = image
                
                let elapsed = NSDate().timeIntervalSince(start as Date)
                print(elapsed)
                
            // Failure
            } else {
                // デフォルトのイメージセット
//                completion(placeholder)
                
            }
        }
        
    }
    

    /// URLからUIImageViewを生成する(SDWebImage)
    func setImageBySDWebImage(with url: URL) {
        
        let start = NSDate()
        
        self.sd_setImage(with: url) { [weak self] image, error, _, _ in

            // Success
            if error == nil, let image = image {
                self?.image = image
                
                let elapsed = NSDate().timeIntervalSince(start as Date)
                print(elapsed)
                
            // Failure
            } else {
                // デフォルトのイメージセット
                //                completion(placeholder)
                
            }
        }
        
    }

}
