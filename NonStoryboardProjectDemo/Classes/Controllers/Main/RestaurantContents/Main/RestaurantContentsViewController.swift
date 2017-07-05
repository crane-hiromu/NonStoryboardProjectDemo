//
//  RestaurantContentsViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class RestaurantContentsViewController: UIViewController {
    
    // MARK: Fileprivate ViewItems
    fileprivate var collectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            let edgeLength = view.frame.width / 3 - 10
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.itemSize = CGSize(width: edgeLength, height: edgeLength)
        }
    }

    fileprivate var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.dataSource = self
        }
    }
    
    fileprivate var locationButton: UIBarButtonItem! {
        didSet {
            locationButton = CustomBarButtonItem().setLocation(self, selector: #selector(self.showLocationView))
            locationButton.tintColor = .gray
        }
    }
    
    fileprivate var photoButton: UIBarButtonItem! {
        didSet {
            photoButton = CustomBarButtonItem().setPhoto(self, selector: #selector(self.showPhotoView))
            photoButton.tintColor = .orange
        }
    }
    
    fileprivate var settingButton: UIBarButtonItem! {
        didSet {
            settingButton = CustomBarButtonItem().setSetting(self, selector: #selector(self.showSettingModalView))
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
extension RestaurantContentsViewController: UIViewControllerProtcol {
    
    func setUpNavigationBar() {
        settingButton = UIBarButtonItem()
        locationButton = UIBarButtonItem()
        photoButton = UIBarButtonItem()

        navigationItem.leftBarButtonItem = settingButton
        navigationItem.rightBarButtonItems = [locationButton, photoButton]
    }

    // MARK: Internal Protcol Methods
    func setUpViewItems() {
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        view.addSubview(collectionView)
    }

}

// MARK: - UICollectionViewDataSource
extension RestaurantContentsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.orange
        return cell
    }
}

// MARK: - Function
extension RestaurantContentsViewController {

    // MARK: Selector Methods
    func showLocationView() {
        navigationItem.title = R.string.localized.nav_title_restaurant_locations()

        locationButton.tintColor = .blue
        photoButton.tintColor = .gray

        collectionView?.isHidden = true
        // ロケーション画面?.isHidden = false
    }

    func showPhotoView() {
        navigationItem.title = R.string.localized.nav_title_restaurant_photos()

        locationButton.tintColor = .gray
        photoButton.tintColor = .orange

        collectionView?.isHidden = false
        // ロケーション画面?.isHidden = true
    }
    
    func showSettingModalView() {
        showModalView(nextView: RestaurantContentsSettingViewController(), animation: .crossDissolve)
    }

}
