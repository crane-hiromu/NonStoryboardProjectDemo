//
//  MainContentsViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class MainContentsViewController: UIViewController {

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScreen();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

// MARK: - UIViewControllerProtcol
extension MainContentsViewController: UIViewControllerProtcol {

    // MARK: Internal Methods
    func setUpScreen() {
        title = R.string.localized.nav_title_main()
        
        if(navigationItem(rawValue: .location)) {
            print("t")
        } else {
            print("f")
        }
        navigationItem.rightBarButtonItem = CustomBarButtonItem().set(image: .locationIcon, self, selector: .showLocationView)
        
    }
    
    func showLocationView() {
    
    }
    
    func showPhotoView() {
        
    }
    
    

}


// MARK: - NavigationItem Fileprivate Enum
fileprivate enum NavBarButtonItem {
    case location
    case photo

    var display: UIImage {
        switch self {
        case .location: return R.image.nav_location_icon()!
        case .photo: return R.image.nav_photo_icon()!
        }
    }

    var action: Selector {
        switch self {
        case .location: return #selector(MainContentsViewController.showLocationView)
        case .photo: return #selector(MainContentsViewController.showPhotoView)
        }
    }
}


//
//// MARK: - Selector Fileprivate Extension
//fileprivate extension Selector {
//    static let showLocationView = #selector(MainContentsViewController.showLocationView)
//    static let showPhotoView = #selector(MainContentsViewController.showPhotoView)
//}
//
//// MARK: - UIImage Fileprivate Extension
//fileprivate extension UIImage {
//    static let locationIcon = R.image.nav_location_icon()!
//    static let photoIcon = R.image.nav_photo_icon()!
//}
//
