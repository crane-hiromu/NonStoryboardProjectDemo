//
//  RestaurantListTableViewCell.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/15.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

class RestaurantListTableViewCell: UITableViewCell {
    
    // MARK: IBOutlet Instances
    @IBOutlet private weak var restaurantIcon: UIImageView!
    @IBOutlet private weak var restaurantTitle: UILabel!
    @IBOutlet private weak var restaurantText: UILabel!

    // MARK: Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: Intenal Methods
    func setUpCell(with model: SearchRestaurantModel) {
        
        let restaurant = model.rest

        // 画像２があればセットし、なければ画像１をセットする
        if let urlString = restaurant.image_url.shop_image2, !urlString.isEmpty, let url = URL(string: urlString) {
            restaurantIcon.setImageByAlamofire(with: url) { [weak self] in self?.restaurantIcon.image = $0 }

        } else if let urlString = restaurant.image_url.shop_image1, !urlString.isEmpty, let url = URL(string: urlString) {
            restaurantIcon.setImageByAlamofire(with: url) { [weak self] in self?.restaurantIcon.image = $0 }
        }

        restaurantTitle.text = restaurant.name
        restaurantText.text = getAccessInfo(with: restaurant)
    }
    
    // MARK: Private Methods
    private func getAccessInfo(with model: RestaurantInfo) -> String {
        let access = model.access
        
        var accessAddress = ""

        if let line = access.line, !line.isEmpty {
            accessAddress += line
        }
        
        if let station = access.station, !station.isEmpty {
            accessAddress += station
            accessAddress +=  " "
        }
        
        if let exit = access.station_exit, !exit.isEmpty {
            accessAddress += exit
        }
        
        if let walk = access.walk, !walk.isEmpty {
            accessAddress +=  " 徒歩" // todo  ローカライズ
            accessAddress += walk
            accessAddress +=  "分" // todo  ローカライズ
        }
        
        return accessAddress
    }

}

