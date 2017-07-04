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
    
    // MARK: Fileprivet ViewItems
    fileprivate var collectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumInteritemSpacing = 5.0
            collectionViewLayout.minimumLineSpacing = 5.0
            collectionViewLayout.itemSize = CGSize(width:100, height:100)
        }
    }
    
    fileprivate var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.dataSource = self
            view.addSubview(collectionView)
        }
    }

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpViewItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

// MARK: - UIViewControllerProtcol
extension MainContentsViewController: UIViewControllerProtcol {

    // MARK: Internal Protcol Methods
    func setUpNavigationBar() {
        showPhotoView() //初回表示ではお店の写真一覧を出すようにしている。
    }
    
    func setUpViewItems() {
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
    }
    
    // MARK: Selector Methods
    func showLocationView() {
        navigationItem.title = R.string.localized.nav_title_restaurant_map()
        navigationItem.rightBarButtonItem = CustomBarButtonItem().set(image: .photoIcon, self, selector: .showPhotoView)
    }
    
    func showPhotoView() {
        navigationItem.title = R.string.localized.nav_title_restaurant_photos()
        navigationItem.rightBarButtonItem = CustomBarButtonItem().set(image: .locationIcon, self, selector: .showLocationView)
    }

}

// MARK: - UICollectionViewDataSource
extension MainContentsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.red
        return cell
    }
}

// MARK: - Selector Fileprivate Extension
fileprivate extension Selector {
    static let showLocationView = #selector(MainContentsViewController.showLocationView)
    static let showPhotoView = #selector(MainContentsViewController.showPhotoView)
}

// MARK: - UIImage Fileprivate Extension
fileprivate extension UIImage {
    static let locationIcon = R.image.nav_location_icon() ?? UIImage()
    static let photoIcon = R.image.nav_photo_icon() ?? UIImage()
}




//また見返したいので一旦とっておく
//// MARK: - NavigationItem Fileprivate Enum
//fileprivate enum NavBarButtonItem {
//    case location
//    case photo
//
//    var display: UIImage {
//        switch self {
//        case .location: return R.image.nav_location_icon() ?? UIImage()
//        case .photo: return R.image.nav_photo_icon() ?? UIImage()
//        }
//    }
//
//    var action: Selector {
//        switch self {
//        case .location: return #selector(MainContentsViewController.showLocationView)
//        case .photo: return #selector(MainContentsViewController.showPhotoView)
//        }
//    }
//}
