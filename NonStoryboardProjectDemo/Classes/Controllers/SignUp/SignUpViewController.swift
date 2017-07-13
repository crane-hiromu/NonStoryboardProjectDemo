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
    
    // MARK: Fileprivate ViewItems
    fileprivate var hoge: UILabel! {
        didSet {
            hoge.text = "Hello Mochi!"
            view.addSubview(hoge)
            
            hoge.translatesAutoresizingMaskIntoConstraints = false
            hoge.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
            hoge.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
            hoge.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }
    }

    fileprivate var piyo: UITextField! {
        didSet {
            piyo.frame = CGRect(x:100, y:200, width:200, height:50)
            piyo.layer.position = CGPoint(x: 200, y: 150)
            piyo.borderStyle = UITextBorderStyle.roundedRect
            piyo.delegate = self
            view.addSubview(piyo)
        }
    }

    fileprivate var btn: UIButton! {
        didSet {
            btn.frame = CGRect(x:100 , y:100, width:200, height:30)
            btn.setTitle("push", for: UIControlState.normal)
            btn.backgroundColor = UIColor.red
            btn.layer.position = CGPoint(x: 200, y: 200)
            btn.layer.cornerRadius = 8
            btn.addTarget(self, action: #selector(self.onClickBtn), for: UIControlEvents.touchUpInside)
            view.addSubview(btn)
        }
    }
    
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpViewItems()
        
        setBackgroundGradationColor(top: .main, bottom: .white)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

// MARK: - UIViewControllerProtocol
extension SignUpViewController: UIViewControllerProtocol {

    // MARK: Internal Protcol Methods
    func setUpNavigationBar() {
        hideNavigaionBar()
        navigationItem.title = R.string.localized.nav_title_signup()
        navigationItem.rightBarButtonItem = CustomBarButtonItem().setClose(self, selector: #selector(self.dismissModalView))
    }
    
    func setUpViewItems() {
        hoge = UILabel()
        piyo = UITextField()
        btn = UIButton()
    }
    


}

// MARK:- TextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {

    // キーボードを押し下げる処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.isFirstResponder
    }

}

// MARK: - Function
extension SignUpViewController {

    // MARK: Selector Methods
    func onClickBtn() {
        print("test成功")
        hoge.text = "test成功"
    }

}
