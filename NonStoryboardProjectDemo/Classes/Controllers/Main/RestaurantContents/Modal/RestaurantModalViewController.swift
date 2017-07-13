//
//  RestaurantModalViewController.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/10.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit
import AlamofireImage

// MARK: - Class
class RestaurantModalViewController: UIViewController {
    
    // MARK: Internal Instances
    var imageUrl: URL! // nilチェックしている。
    
    // MARK: Fileprivate Instances
    fileprivate var uiImageView: UIImageView! {
        didSet {
            if imageUrl == nil { dismissModalView() }
            uiImageView.getViewByUrl(url: imageUrl)
            uiImageView.contentMode = .scaleAspectFit
            
            let width = view.frame.width
            let height = view.frame.height
            uiImageView.frame = CGRect(x: 0, y: height/2-width/2, width: width, height: width)
        }
    }

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpViewItems()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dismissModalView()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        let touchPointY = touches.first!.location(in: view).y
        let width = view.frame.width
        let height = uiImageView.frame.height

        if (touchPointY <= height/2-width/2) || (height/2+width/2 <= touchPointY) {
            dismissModalView()
            return
        }
        
        // 画像タップ時の挙動

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - UIViewControllerProtocol
extension RestaurantModalViewController: UIViewControllerProtocol {

    // MARK: Protocol Methods
    func setUpNavigationBar() {
        hideNavigaionBar()
    }
    
    func setUpViewItems() {
        uiImageView = UIImageView()
        view.addSubview(uiImageView)
    }
}

// MARK: Functions
extension RestaurantModalViewController {}
