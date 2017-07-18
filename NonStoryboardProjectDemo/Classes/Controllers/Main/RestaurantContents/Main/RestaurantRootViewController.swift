//
//  RestaurantRootViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON

// MARK: - Class
class RestaurantRootViewController: UIViewController {

    // MARK: Fileprivate Instances
    fileprivate var currentLocation = CLLocationCoordinate2D()
    fileprivate var restaurantInfoArray: [SearchRestaurantModel] = []
    fileprivate var restaurantImageArray: [URL] = []
    fileprivate var restaurantLocations: [MKAnnotation] = []
    fileprivate let notification = NotificationCenter.default

    // MARK: Fileprivate ViewItems
    fileprivate var collectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            let edgeLength = view.frame.width/3 - 12 // 程よい隙間を設定するために-7を使用。端末ごとにテストし問題なければこの値のままで。
            // let edgeLength = view.frame.width/2 - 10 // 設定で並び順を変えられるようにしたい
            collectionViewLayout.minimumLineSpacing = 10
            collectionViewLayout.sectionInset = UIEdgeInsetsMake(5,5,5,5)

            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.itemSize = CGSize(width: edgeLength, height: edgeLength)
        }
    }

    fileprivate var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    fileprivate var locationButton: UIBarButtonItem! {
        didSet {
            locationButton = CustomBarButtonItem().setLocation(self, selector: #selector(self.showLocationView))
            locationButton.tintColor = .gray // 通常はblueだが、初期表示は画像一覧を出すため、grayに設定しておく
        }
    }
    
    fileprivate var photoButton: UIBarButtonItem! {
        didSet {
            photoButton = CustomBarButtonItem().setPhoto(self, selector: #selector(self.showPhotoView))
            photoButton.tintColor = .orange
        }
    }
    
    fileprivate var screenButton: UIBarButtonItem! {
        didSet {
            screenButton = CustomBarButtonItem().setScreen(self, selector: #selector(self.showScreenModalView))
            screenButton.tintColor = .gray // 初期表示はgrayに設定。タップ時にはyellowをセットする。
        }
    }
    
    fileprivate var settingButton: UIBarButtonItem! {
        didSet {
            settingButton = CustomBarButtonItem().setSetting(self, selector: #selector(self.showSettingModalView))
        }
    }
    
    fileprivate var locationManager: CLLocationManager! {
        didSet {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
        }
    }

    fileprivate var mapView: MKMapView! {
        didSet {
            mapView.frame = view.bounds
            mapView.delegate = self
            mapView.showsUserLocation = true
            mapView.showsScale = true
            mapView.mapType = .standard
            mapView.isHidden = true // 初期表示は画像一覧のためViewを隠しておく
        }
    }

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpViewItems()
        #if arch(i386) || arch(x86_64)
            setUpCollectionViewItems()
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        screenButton.tintColor = .gray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        notification.addObserver(self, selector: #selector(self.onOrientationChange), name: .UIDeviceOrientationDidChange, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        notification.removeObserver(self, name: .UIDeviceOrientationDidChange, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

// MARK: - UIViewControllerProtocol
extension RestaurantRootViewController: UIViewControllerProtocol {

    // MARK: Protcol Methods
    func setUpNavigationBar() {
        settingButton = UIBarButtonItem()
        screenButton = UIBarButtonItem()
        locationButton = UIBarButtonItem()
        photoButton = UIBarButtonItem()

        navigationItem.leftBarButtonItems = [settingButton, screenButton]
        navigationItem.rightBarButtonItems = [locationButton, photoButton]
    }

    func setUpViewItems() {
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        locationManager = CLLocationManager()
        mapView = MKMapView()
        
        view.addSubview(collectionView)
        view.addSubview(mapView)
        
        setBackgroundGradationColor(top: .main, bottom: .white)
    }

}

import Nuke

// MARK: - UICollectionView Implement
extension RestaurantRootViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: Implement Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = RestaurantModalViewController()
        viewController.imageUrl = restaurantImageArray[indexPath.row]
        viewController.setBackgroundClear(alpha: 0.5)
        showModalView(nextView: viewController, animation: .crossDissolve)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // todo カスタムセルにしたい
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        cell.backgroundView?.removeFromSuperview()

        let imageUrl = restaurantImageArray[indexPath.row]
//        cell.backgroundView = UIImageView().setImageByAlamofire(with: imageUrl)
//        cell.backgroundView = UIImageView().setImageByNuke(with: imageUrl)
        
        let start = NSDate()
        let imageView = UIImageView()
        imageView.setImageBySDWebImage(with: imageUrl) { image in
            imageView.image = image
            let elapsed = NSDate().timeIntervalSince(start as Date)
            print(elapsed)
        }
        cell.backgroundView = imageView
        
        //色の判定もできればしたい
//        let restaurant = restaurantInfoArray[indexPath.row]
//        restaurant.rest.id
        cell.backgroundColor = .orange

        return cell
    }
}

// MARK: - MKMapViewDelegate Implement
extension RestaurantRootViewController: MKMapViewDelegate {

    // MARK: Implement Methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pinView = MKPinAnnotationView()
        pinView.annotation = annotation
        pinView.pinTintColor = .blue
        pinView.canShowCallout = true
        return pinView
    }

}

// MARK: - CLLocationManagerDelegate Implement
extension RestaurantRootViewController: CLLocationManagerDelegate {

    // MARK: Implement Methods
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation() // 一度だけ位置情報を取得する
            
        default:
            locationManager.requestWhenInUseAuthorization() // アプリ起動中のみ位置情報を使用するための許諾
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard var newLocation = locations.first?.coordinate else {
            locationManager.requestLocation()
            return
        }
        currentLocation.latitude = newLocation.latitude
        currentLocation.longitude = newLocation.longitude
        setUpCollectionViewItems()

        let radius: CLLocationDistance = 500 // いずれは設定で変更できるように、realmからとってくるようにしたい

        #if (arch(i386) || arch(x86_64)) && os(iOS)
            // シュミレータの場合は渋谷駅になるようにしている。
            newLocation.latitude = 35.658034
            newLocation.longitude = 139.701636
        #endif

        let region = MKCoordinateRegionMakeWithDistance(newLocation, radius, radius)
        mapView.setRegion(region, animated: true) // 現在座標を中心に地図を表示
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.requestLocation() //位置情報の取得に失敗した場合、もう一度位置情報を取得する
    }
    
}

// MARK: - Network Function
extension RestaurantRootViewController {

    // MARK: Fileprivate Methods
    fileprivate func setUpCollectionViewItems() {

        #if (arch(i386) || arch(x86_64)) && os(iOS)
            let latitude = 35.658034
            let longitude = 139.701636
        #else
            let latitude = currentLocation.latitude
            let longitude = currentLocation.longitude
        #endif
        
        let parameters = SearchRestaurantRequestParameters(latitude: latitude, longitude: longitude, hit_per_page: 100).parameters

        NetworkManager().callForSearchRestaurant(parameters) { response in
            self.restaurantInfoArray = response
            self.setUpImages()
            self.collectionView.reloadData()

            self.removePinsOnView()
            self.appendPinsOnView()
        }
    }
    
    // MARK: Private Methods
    private func setUpImages(){
        restaurantImageArray = []

        // ぐるなびAPIレスポンスでは2枚の画像urlが返ってくる。1枚目：店のロゴ、2枚目：料理画像 であることが多い。
        // 2枚目があれば表示、なければ1枚目を表示できるように配列にURLを格納しておく。画像がない場合は表示しない。
        for restaurant in restaurantInfoArray {
            if let urlString = restaurant.rest.image_url.shop_image2, !urlString.isEmpty, let url = URL(string: urlString) {
                restaurantImageArray.append(url)
            } else if let urlString = restaurant.rest.image_url.shop_image1, !urlString.isEmpty, let url = URL(string: urlString) {
                restaurantImageArray.append(url)
            }
        }
    }
    
}

// MARK: - Function
extension RestaurantRootViewController {

    // MARK: Selector Methods
    func showLocationView() {
        locationButton.tintColor = .blue
        photoButton.tintColor = .gray

        collectionView?.isHidden = true
        mapView?.isHidden = false
    }

    func showPhotoView() {
        locationButton.tintColor = .gray
        photoButton.tintColor = .orange

        collectionView?.isHidden = false
        mapView?.isHidden = true
    }
    
    func showScreenModalView() {
        screenButton.tintColor = .yellow
        let viewController = RestaurantScreenViewController()
        viewController.setBackgroundClear()
        showModalView(nextView: viewController)
    }
    
    func showSettingModalView() {
        showModalNavView(nextView: RestaurantSettingViewController(), animation: .crossDissolve)
    }

    // MARK: Selector Notificaiton Methods
    func onOrientationChange(notification: NSNotification){
        let deviceOrientation = UIDevice.current.orientation
        collectionViewLayout.scrollDirection = UIDeviceOrientationIsLandscape(deviceOrientation) ? .horizontal : .vertical
    }

    // MARK: Fileprivate Methods
    fileprivate func appendPinsOnView() {
        restaurantLocations = []
        for item in restaurantInfoArray {
            let annotation = MKPointAnnotation()
            let info = item.rest
            annotation.coordinate = CLLocationCoordinate2DMake(info.latitude, info.longitude)
            annotation.title = info.name
            restaurantLocations.append(annotation)
        }
        mapView.addAnnotations(restaurantLocations)
    }

    fileprivate func removePinsOnView() {
        mapView.removeAnnotations(restaurantLocations)
    }

// 位置情報を手動で再取得する場合はこちらを実装したい
//    // MARK: Fileprivate Methods
//    fileprivate func updateLocation() {
//        locationManager.requestLocation()
//    }

}
