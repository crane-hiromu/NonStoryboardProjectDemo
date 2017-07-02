//
//  SubContentsViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

class SubContentsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScreen();
        ColorUtils().setBackground(view, top: ColorType.main.display, bottom: UIColor.black)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK:- Functions
extension SubContentsViewController {
    
    fileprivate func setUpScreen() {
        //title = R.string.localized.nav_title_sub()
        title = "sub"
    }

}
