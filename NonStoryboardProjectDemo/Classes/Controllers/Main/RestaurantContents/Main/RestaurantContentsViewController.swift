//
//  RestaurantContentsViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit
import MapKit

// MARK: - Class
class RestaurantContentsViewController: UIViewController {

    // MARK: Fileprivate Instance
//    fileprivate var clLocations = CLLocationCoordinate2D()
    fileprivate var restaurantLocations: [MKAnnotation] = []
    fileprivate let notification = NotificationCenter.default

    // MARK: Fileprivate ViewItems
    fileprivate var collectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            let edgeLength = view.frame.width / 3 - 10 // 程よい隙間を設定するために-10を使用。端末ごとにテストし問題なければこの値のままで。
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.itemSize = CGSize(width: edgeLength, height: edgeLength)
        }
    }

    fileprivate var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.delegate = self
            collectionView.dataSource = self
            //collectionView.reloadData() //いずれ検索変更の際に実装予定
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
    
    fileprivate var settingButton: UIBarButtonItem! {
        didSet {
            settingButton = CustomBarButtonItem().setSetting(self, selector: #selector(self.showSettingModalView))
        }
    }
    
    fileprivate var locationManager: CLLocationManager! {
        didSet {
            locationManager.delegate = self
        }
    }

    fileprivate var mapView: MKMapView! {
        didSet {
            mapView.frame = view.bounds
            mapView.delegate = self
            mapView.showsUserLocation = true
            mapView.showsScale = true
            mapView.isHidden = true // 初期表示は画像一覧のためViewを隠しておく
        }
    }

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        setUpViewItems()
        setUpImages()

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

// MARK: - UIViewControllerProtcol
extension RestaurantContentsViewController: UIViewControllerProtcol {

    // MARK: Protcol Methods
    func setUpNavigationBar() {
        settingButton = UIBarButtonItem()
        locationButton = UIBarButtonItem()
        photoButton = UIBarButtonItem()

        navigationItem.leftBarButtonItem = settingButton
        navigationItem.rightBarButtonItems = [locationButton, photoButton]
    }

    func setUpViewItems() {
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        view.addSubview(collectionView)
        
        locationManager = CLLocationManager()
        
        mapView = MKMapView()
        view.addSubview(mapView)
    }

}

// MARK: - UICollectionView Implement
extension RestaurantContentsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: Implement Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("選択しました: \(indexPath.row)")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.orange
        return cell
    }
}

// MARK: - MKMapViewDelegate Implement
extension RestaurantContentsViewController: MKMapViewDelegate {

//    // MARK: Implement Methods
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        //アノテーションビューを生成する。
//        let testPinView = MKPinAnnotationView()
//
//        //アノテーションビューに座標、タイトル、サブタイトルを設定する。
//        testPinView.annotation = annotation
//
//        //アノテーションビューに色を設定する。
//        testPinView.pinTintColor = UIColor.blue
//
//        //吹き出しの表示をONにする。
//        testPinView.canShowCallout = true
//
//        return testPinView
//    }

}

// MARK: - CLLocationManagerDelegate Implement
extension RestaurantContentsViewController: CLLocationManagerDelegate {
    
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
        guard let newLocation = locations.first?.coordinate else {
            locationManager.requestLocation()
            return
        }

        let radius: CLLocationDistance = 500 // いずれは設定で変更できるように、realmからとってくるようにしたい
        let region = MKCoordinateRegionMakeWithDistance(newLocation, radius, radius);
        mapView.setRegion(region, animated: true) // 現在座標を中心に地図を表示
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.requestLocation() //位置情報の取得に失敗した場合、もう一度位置情報を取得する
    }
    
}

// MARK: - Neswork Function
extension RestaurantContentsViewController {

    // MARK: Fileprivate Methods
    fileprivate func setUpImages() {
        let parameters = SearchRestaurantRequestParameters(latitude: 35.658034, longitude: 139.701636).parameters
        NetworkManager().callForGurunavi(SearchRestaurantRequest.post(parameters: parameters)) { response in
            switch response {
            case .success(let result):
                print("---- log ----")
                print(result)

            case .failure(let error):
                print("error")
            }
        }
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
        mapView?.isHidden = false
    }

    func showPhotoView() {
        navigationItem.title = R.string.localized.nav_title_restaurant_photos()

        locationButton.tintColor = .gray
        photoButton.tintColor = .orange

        collectionView?.isHidden = false
        mapView?.isHidden = true
    }
    
    func showSettingModalView() {
        showModalView(nextView: RestaurantContentsSettingViewController(), animation: .crossDissolve)
    }

    // MARK: Selector Notificaiton Methods
    func onOrientationChange(notification: NSNotification){
        let deviceOrientation = UIDevice.current.orientation
        collectionViewLayout.scrollDirection = UIDeviceOrientationIsLandscape(deviceOrientation) ? .horizontal : .vertical
    }

// ピンを表示、消す処理　あとでレスポンスの中身が整理できたら作成する
//    fileprivate func appendPinsOnView() {
////        for location in  {
////            let annotation = MKPointAnnotation()
////            annotation.coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
////            restaurantLocations.append(annotation)
////        }
//        mapView.addAnnotations(restaurantLocations)
//    }
//
//    fileprivate func removePinsOnView() {
//        mapView.removeAnnotations(restaurantLocations)
//    }

// 位置情報を手動で再取得する場合はこちらを実装したい
//    // MARK: Fileprivate Methods
//    fileprivate func updateLocation() {
//        locationManager.requestLocation()
//    }

}
