//
//  RestaurantListViewController.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

// MARK: - Class
class RestaurantListViewController: UIViewController {
    
    // Fileprivate Instances // テスト用のデータのため実装後は空に
    fileprivate var restaurantInfoArray: [SearchRestaurantModel] = [SearchRestaurantModel(), SearchRestaurantModel(), SearchRestaurantModel()]
    
    // MARK: IBOutlets and IBActions
    @IBOutlet private weak var leftContentView: UIView!
    @IBOutlet private weak var rightContentView: UIView!

    @IBOutlet fileprivate weak var restaurantTableView: UITableView! {
        didSet {
            restaurantTableView.delegate = self
            restaurantTableView.dataSource = self
        }
    }
    
    @IBAction private func restaurantControl(_ sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            leftContentView.isHidden = false
            rightContentView.isHidden = true
            
        case 1:
            leftContentView.isHidden = true
            rightContentView.isHidden = false
            
        default: break
        }
    }

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = R.string.localized.nav_title_sub()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.showNextView))

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension RestaurantListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.restaurantListCell) else { return UITableViewCell() }

        // test model
        restaurantInfoArray[0].rest.name = "魚魯魚魯 渋谷宮益坂店"
        restaurantInfoArray[0].rest.access.line = "ＪＲ"
        restaurantInfoArray[0].rest.access.station = "新橋駅"
        restaurantInfoArray[0].rest.access.station_exit = "烏森口"
        restaurantInfoArray[0].rest.access.walk = "1"

        restaurantInfoArray[1].rest.name = "魚魯魚魯 渋谷宮益坂店"
        restaurantInfoArray[1].rest.access.line = "ＪＲ"
        restaurantInfoArray[1].rest.access.station = "新橋駅"
        restaurantInfoArray[1].rest.access.station_exit = ""
        restaurantInfoArray[1].rest.access.walk = "1"

        restaurantInfoArray[2].rest.name = "魚魯魚魯 渋谷宮益坂店"
        restaurantInfoArray[2].rest.access.line = "ＪＲ"
        restaurantInfoArray[2].rest.access.station = "新橋駅"
        restaurantInfoArray[2].rest.access.station_exit = "東口"
        restaurantInfoArray[2].rest.access.walk = "3"
        //

        cell.setUpCell(with: restaurantInfoArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - Function
extension RestaurantListViewController {

    // MARK: - Selector Methods
    func showNextView() {
        //ただの画面遷移だけの場合
        //        let viewController = SignUpViewController()
        //        self.navigationController?.pushViewController(viewController, animated: true)        
        showModalNavView(nextView: SignUpViewController(), animation: .crossDissolve)
    }
    
}
