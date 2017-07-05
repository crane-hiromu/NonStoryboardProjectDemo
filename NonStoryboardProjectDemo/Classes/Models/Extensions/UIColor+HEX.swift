//
//  UIColor+HEX.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

extension UIColor {

    /// UIColor(hex: 0xFFFFFF)形式で色を指定できる
    /// - Parameter hex: 色
    /// - Parameter alpha: 透過率（デフォルト 1.0）
    convenience init(hex: Int, alpha: Double = 1.0) {
        let denominator = 255.0
        let red = CGFloat((hex & 0xFF0000) >> 16) / denominator
        let green = CGFloat((hex & 0x00FF00) >> 8) / denominator
        let blue = CGFloat(hex & 0x0000FF) / denominator
        self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }

}
