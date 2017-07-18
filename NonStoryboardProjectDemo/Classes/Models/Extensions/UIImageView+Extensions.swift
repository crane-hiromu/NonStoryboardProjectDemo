//
//  UIImageView+Extensions.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/11.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Nuke
//import NukeAlamofirePlugin
import Kingfisher
import SDWebImage

extension UIImageView {
    
    /// URLからUIImageViewを生成する(iOS Default)
    /// - parameter url: URL型
    func setImageByDefault(with url: URL, completion: @escaping (UIImage) -> Void) {
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                switch data {
                case .some(let result):
                    guard let image = UIImage(data: result) else { return }
                    completion(image)
                    
                case .none(_):
                    // デフォルトのイメージセット
                    break
                }
                
            } else {
                // デフォルトのイメージセット

            }
        }.resume()
    }

    /// URLからUIImageViewを生成する(AlamofireImage)
    /// - parameter url: URL型
    @discardableResult
//    func setImageByAlamofire(with url: URL, placeholder: UIImage, completion: @escaping (UIImage) -> Void) {
    func setImageByAlamofire(with url: URL, completion: @escaping (UIImage) -> Void) {
        let request = URLRequest(url: url)
        
//        af_setImage(withURLRequest: request, placeholderImage: placeholder, imageTransition: .flipFromBottom(1)) { response in
        af_setImage(withURLRequest: request) { response in
            switch response.result {
            case .success(let result):
                completion(result)
                
            case .failure(_):
                // デフォルトのイメージセット
                break
            }
        
        }
    }

    /// URLからUIImageViewを生成する(Nuke)
    /// - parameter url: URL型
    func setImageByNuke(with url: URL, completion: @escaping (UIImage) -> Void) {
        let request = Request(url: url)
        
        Nuke.Manager.shared.loadImage(with: request, into: self) { response, isResponse in
            if isResponse {
                switch response {
                case .success(let result):
                    completion(result)
                    
                case .failure(_):
                    // デフォルトのイメージセット
                    break
                }
            } else {
                // デフォルトのイメージセット
            }
            
        }
    }
    
    /// URLからUIImageViewを生成する(Kingfisher)
    /// - parameter urlString: URL(string型)
    /// - parameter placeholder: デフォルトの画像（UIImage）
    /// - parameter completion: コールバック関数
//    func setImageByKingfisher(with url: URL, placeholder: UIImage, completion: @escaping (UIImage) -> Void) {
    func setImageByKingfisher(with url: URL, completion: @escaping (UIImage) -> Void) {
        
//        kf.indicator?.startAnimatingView()
        
        self.kf.setImage(with: url) { [weak self] image, error, _, _ in
            
            // Success
            if error == nil, let image = image {
                completion(image)
                
            // Failure
            } else {
                // デフォルトのイメージセット
//                completion(placeholder)
                
            }
//            self?.kf.indicator?.stopAnimatingView()
        }
        
    }
    

    /// URLからUIImageViewを生成する(SDWebImage)
    func setImageBySDWebImage(with url: URL, completion: @escaping (UIImage) -> Void) {
        
        self.sd_setImage(with: url) { image, error, _, _ in

            // Success
            if error == nil, let image = image {
                completion(image)
                
            // Failure
            } else {
                // デフォルトのイメージセット
                //                completion(placeholder)
                
            }
        }
        
    }

}
