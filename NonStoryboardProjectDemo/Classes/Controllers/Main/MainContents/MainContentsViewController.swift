//
//  MainContentsViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

class MainContentsViewController: UIViewController {
    
    var addBtn: UIBarButtonItem!
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScreen();
        
        addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onClick))
        self.navigationItem.rightBarButtonItem = addBtn
        
        // ColorUtils().setBackground(view, top: ColorType.main.display, bottom: UIColor.white)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    func onClick() {
        let viewController = SignUpViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// MARK:- Functions
extension MainContentsViewController {
    
    fileprivate func setUpScreen() {
        title = R.string.localized.nav_title_main()
        
    }

}
