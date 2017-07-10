//
//  UIImageView+Extensions.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/11.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    /// URLからUIImageViewを生成する
    /// parameter url: URL型
    @discardableResult
    func getViewByUrl(url: URL) -> UIImageView {
        af_setImage(withURL: url)
        return self
    }
}
