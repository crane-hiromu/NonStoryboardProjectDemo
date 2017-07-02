//
//  SubContentsViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

class SubContentsViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ColorUtils().setBackground(view, top: ColorType.main.display, bottom: UIColor.black)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
