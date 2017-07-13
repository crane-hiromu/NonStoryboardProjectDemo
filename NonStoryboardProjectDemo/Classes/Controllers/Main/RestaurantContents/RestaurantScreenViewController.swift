//
//  RestaurantScreenViewController.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/12.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class RestaurantScreenViewController: UIViewController {
    
    // MARK: Fileprivate Instances
    fileprivate var cardSeparator = CGFloat(4) // カードの大きさを決める数字。数字はviewの高さの分割数を表す。
    fileprivate var cardHeight: CGFloat = CGFloat()

    // MARK: Fileprivate Methods
    fileprivate var cardView: UIView! {
        didSet {
            let viewLayer = cardView.layer
            viewLayer.borderColor = UIColor.lightGray.cgColor
            viewLayer.backgroundColor = UIColor.white.cgColor
            viewLayer.borderWidth = 2
            viewLayer.cornerRadius = 30
            viewLayer.masksToBounds = true
            
            let startPoint = CGFloat(5)
            viewLayer.frame = CGRect(x: startPoint, y: cardHeight*(cardSeparator-1), width: view.frame.width-startPoint*2, height: cardHeight)
        }
    }

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewItems()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dismissModalView()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: view) else { return }

        if (location.y <= cardHeight*(cardSeparator-1)) {
            dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - Functions
extension RestaurantScreenViewController {
    
    // MARK: Fileprivate Methods
    fileprivate func setUpViewItems() {
        cardHeight = view.frame.height/cardSeparator
        cardView = UIView()
        view.addSubview(cardView)
    }

}
