//
//  SearchRestaurantReponse.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/07.
//  Copyright © 2017年 T.H. All rights reserved.
//

import ObjectMapper

class SearchRestaurantResponse: Mappable {
    var id: Int?
    var name: String?
    var latitude: Double?
    var longitude: Double?
    var pr_short: String?
    var shop_image1: URL?
    var shop_image2: URL?
    
//  //後々実装予定だが先に置いておく
//    var opentime: String?
//    var lunch
//    var credit_card: String
//    var category_name_l: String
//    var tel: String
//    var holiday
//    var url
//    var coupon_url
//    var access 中に何個か階層がある
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        pr_short <- map["pr_short"]
        shop_image1 <- map["shop_image1"]
        shop_image2 <- map["shop_image2"]
    }
}
