//
//  MainContentsViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class MainContentsViewController: UIViewController {

    // MARK: Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar();
        
        // ColorUtils().setBackground(view, top: ColorType.main.display, bottom: UIColor.white)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

// MARK: - Functions
extension MainContentsViewController {
    
    // MARK: Internal Method
    func showNextView() {
        //ただの画面遷移だけの場合
        //        let viewController = SignUpViewController()
        //        self.navigationController?.pushViewController(viewController, animated: true)
        
        let viewController = SignUpViewController()
        let modalView = UINavigationController(rootViewController: viewController)
        modalView.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(modalView, animated: true, completion: nil)
    }
    
    // MARK: Fileprivate Method
    fileprivate func setUpNavigationBar() {
        title = R.string.localized.nav_title_main()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.showNextView))
    }

}
