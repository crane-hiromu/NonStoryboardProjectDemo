//
//  ViewHelpers.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

final class ViewHelpers {
    
    func createUIView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    /// ２色を指定すると、１色目から２色目へ、上から下のグラデーションが付く
    /// - parameter view: 対象のView
    /// - parameter topColor: １色目
    /// - parameter bottomColor: ２色目
    func setBackgroundColor(_ view: UIView, top topColor: UIColor, bottom bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
