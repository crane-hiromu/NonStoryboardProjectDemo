//
//  MainTabBarController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class MainTabBarController: UITabBarController {

    // MARK: Fileprivate Instances
    fileprivate var tabs: [UIViewController] = []
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpToAppendTab(MainContentsViewController(), R.string.localized.tab_title_main(), R.image.tab_bar_home_icon())
        setUpToAppendTab(SubContentsViewController(), R.string.localized.tab_title_sub(), R.image.tab_bar_home_icon())
        
        setViewControllers(tabs, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

// MARK: - Functions
extension MainTabBarController {
    
    // MARK: Fileprivate Methods
    fileprivate func setUpToAppendTab(_ controller: UIViewController, _ title: String, _ image: UIImage?) {
        guard let image = image else { return }

        let tagNumber = tabs.count+1 // タグナンバーを自動で設定するために、配列内のコントローラの数を取得している。
        controller.tabBarItem = UITabBarItem(title: title, image: image, tag: tagNumber)

        let navigationController = UINavigationController(rootViewController: controller)
        tabs.append(navigationController)

    }

}
