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
        
        setUpToAppendTab(RestaurantRootViewController(), R.string.localized.tab_title_search(), #imageLiteral(resourceName: "tab_bar_search_icon"))
        setUpToAppendTab(SubContentsViewController(), R.string.localized.tab_title_home(), #imageLiteral(resourceName: "tab_bar_home_icon"))
        
        setViewControllers(tabs, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

// MARK: - Function
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
