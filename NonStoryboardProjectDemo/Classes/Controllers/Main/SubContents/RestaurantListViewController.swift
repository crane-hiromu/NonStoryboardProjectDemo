//
//  SubContentsViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class SubContentsViewController: UIViewController {
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpViewItems()

        setBackgroundGradationColor(top: .main, bottom: .black)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK: - UIViewControllerProtocol
extension SubContentsViewController: UIViewControllerProtocol {
    
    // MARK: Internal Protcol Methods
    func setUpNavigationBar() {
        navigationItem.title = R.string.localized.nav_title_sub()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.showNextView))
    }
    
    func setUpViewItems() {
    
    }

}

// MARK: - Function
extension SubContentsViewController {

    // MARK: - Selector Methods
    func showNextView() {
        //ただの画面遷移だけの場合
        //        let viewController = SignUpViewController()
        //        self.navigationController?.pushViewController(viewController, animated: true)        
        showModalNavView(nextView: SignUpViewController(), animation: .crossDissolve)
    }
    
}
