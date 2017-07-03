//
//  SignUpViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class SignUpViewController: UIViewController {
    
    let hoge = UILabel()
    
    // MARK: Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

// MARK: - Functions
extension SignUpViewController: UITextFieldDelegate {

    // MARK: Fileprivate Method
    fileprivate func setUpScreen() {
        // label
        
        hoge.frame = CGRect(x:100, y:100, width:200, height:200)
        hoge.text = "Hello Mochi!"
        hoge.layer.position = CGPoint(x: 200, y: 50)
        self.view.addSubview(hoge)
        
        // text field
        let piyo = UITextField()
        piyo.frame = CGRect(x:100, y:200, width:200, height:50)
        piyo.layer.position = CGPoint(x: 200, y: 100)
        piyo.borderStyle = UITextBorderStyle.roundedRect
        piyo.delegate = self
        self.view.addSubview(piyo)
        
        // button
        let btn = UIButton()
        btn.frame = CGRect(x:100 , y:100, width:200, height:30)
        btn.setTitle("push", for: UIControlState.normal)
        btn.backgroundColor = UIColor.red
        btn.layer.position = CGPoint(x: 200, y: 150)
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(self.onClickBtn), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
        
        ColorUtils().setBackground(view, top: ColorType.main.display, bottom: UIColor.white)
    }
    
    // キーボードを押し下げる処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func onClickBtn() {
        print("test成功")
        hoge.text = "test成功"
    }

}
