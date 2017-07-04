//
//  CustomBarButtonItem.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/04.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Struct
struct CustomBarButtonItem {

    /// ナビゲーションバーに画像をセットできる
    /// - Parameter image: 画像
    /// - Parameter style: 文字スタイル(デフォルト .plain)
    /// - Parameter view: 対象のView
    /// - Parameter selector: コールバック関数
    func set(image: UIImage, style: UIBarButtonItemStyle = .plain,_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(image: image, style: style, target: view, action: selector)
    }

    
    /* --- アイコン --- */

    /// ナビゲーションバーにバツアイコンを設定
    func setClose(_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .stop, target: view, action: selector)
    }
    
    /// ナビゲーションバーにプラスアイコンを設定
    func setAdd(_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .add, target: view, action: selector)
    }
    
    /// ナビゲーションバーにリフレッシュアイコンを設定
    func setRefresh(_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .refresh, target: view, action: selector)
    }
    
    /// ナビゲーションバーにカメラアイコンを設定
    func setCamera(_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .camera, target: view, action: selector)
    }


    /* --- テキスト --- */
 
    /// ナビゲーションバーにCancelボタンを設定
    func setCancel(_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .cancel, target: view, action: selector)
    }
    
    /// ナビゲーションバーにSaveボタンを設定
    func setSave(_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .save, target: view, action: selector)
    }
    
    /// ナビゲーションバーにEditボタンを設定
    func setEdit(_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .edit, target: view, action: selector)
    }
    
    /// ナビゲーションバーにDoneボタンを設定
    func setDone(_ view: UIViewController, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .done, target: view, action: selector)
    }
    

}
