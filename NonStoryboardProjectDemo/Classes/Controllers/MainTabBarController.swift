//
//  MainTabBarController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit
//import Rswift

class MainTabBarController: UITabBarController {
    
    let mainContentsViewController = MainContentsViewController()
    let subContentsViewController = SubContentsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "title"

//        mainContentsViewController.tabBarItem = UITabBarItem(title: R.string.localizable.tabbar_title_main(), image: R.image.tab_bar_home_icon(), tag: 1)
//        subContentsViewController.tabBarItem = UITabBarItem(title: R.string.localizable.tabbar_title_sub(), image: R.image.tab_bar_home_icon(), tag: 2)
        
        
        mainContentsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        subContentsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

        let mainTabs = [mainContentsViewController, subContentsViewController]
        setViewControllers(mainTabs, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
