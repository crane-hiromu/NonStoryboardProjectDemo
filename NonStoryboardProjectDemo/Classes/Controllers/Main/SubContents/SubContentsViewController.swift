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
    
    // MARK: Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScreen();
        ViewHelpers().setBackgroundColor(view, top: Utils.Color.main, bottom: UIColor.black)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK: - Functions
extension SubContentsViewController {
    
    fileprivate func setUpScreen() {
        title = R.string.localized.nav_title_sub()
    }

}
