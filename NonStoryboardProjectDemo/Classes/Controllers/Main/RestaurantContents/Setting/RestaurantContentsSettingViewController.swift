//
//  RestaurantContentsSettingViewController.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/05.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class RestaurantContentsSettingViewController: UIViewController {

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        setUpViewItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - UIViewControllerProtcol
extension RestaurantContentsSettingViewController: UIViewControllerProtcol {

    // MARK: Internal Protcol Methods
    func setUpNavigationBar() {
        hideNavigaionBar()
        navigationItem.leftBarButtonItem = CustomBarButtonItem().setClose(self, selector: #selector(self.dismissModalView))
        navigationItem.rightBarButtonItem = CustomBarButtonItem().setRefresh(self, selector: #selector(self.resetSettings))
    }
    
    func setUpViewItems() {
        
    }

}

// MARK: - Functions
extension RestaurantContentsSettingViewController {
    
    // MARK: Selector Methods
    func resetSettings () {
        // 設定をリセットする処理をいずれ実装
        // もし設定がなければ押せない仕様があっていいかも。優先度低
        // 設定をリセットするかどうかの確認アラートを出すこと
        
    }

}
