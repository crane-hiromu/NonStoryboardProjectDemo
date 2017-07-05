//
//  UIViewController+Functions.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/05.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// present()でモーダルを生成する
    func showModalView(nextView: UIViewController, animation: UIModalTransitionStyle = .coverVertical) {
        let viewController = nextView
        let modalView = UINavigationController(rootViewController: viewController)
        modalView.modalTransitionStyle = animation
        present(modalView, animated: true, completion: nil)
    }
    
    /// present()で遷移した場合のモーダルを破棄する
    func dismissModalView(animated: Bool = true) {
        dismiss(animated: animated, completion: nil)
    }

    /// ナビゲーションバーの透過
    func hideNavigaionBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    /// ２色を指定すると、１色目から２色目へ、上から下のグラデーションが付く
    /// - parameter view: 対象のView
    /// - parameter topColor: １色目
    /// - parameter bottomColor: ２色目
    func setBackgroundColor(top topColor: UIColor, bottom bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
