//
//  SearchRestaurantReponse.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/07.
//  Copyright © 2017年 T.H. All rights reserved.
//

//import Realm
import ObjectMapper

/// 'ぐるなびAPI'のレスポンスのキー名をそのまま使用しているため、スネークケースのものがある
class SearchRestaurantResponse: Mappable {
    var id: String?
    var name: String?
    var latitude: Double?
    var longitude: Double?
    var category: String?
    var coupon_url: RestaurantCoupon?
    var tel: String?
    var pr: RestaurantDescription?
    var image: RestaurantImage?
    var opentime: String?
    var holiday: String?
    var access: RestaurantAccess?
    var lunch: Int?
    var credit_card: String?
    
    // 以下、レスポンスには含まれない情報、アプリで管理するもの
    var favoriteFlag: Bool = false
    var wantToGoFlag: Bool = false // haveEnteredFlagがtrueの時は必ずfalseになる
    var haveEnteredFlag: Bool = false

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        category <- map["category"]
        coupon_url <- map["coupon_url"] // URLTransform()
        tel <- map["tel"]
        pr <- map["RestaurantDescription"]
        image <- map["image"]
        holiday <- map["holiday"]
        opentime <- map["opentime"]
        holiday <- map["holiday"]
        access <- map["access"]
        lunch <- map["lunch"]
        credit_card <- map["credit_card"]
    }
}

class RestaurantCoupon: Mappable {
    var pc: String?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        pc <- map["pc"]
    }
}

class RestaurantImage: Mappable {
    var shop_image1: String?
    var shop_image2: String?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        shop_image1 <- map["shop_image1"]
        shop_image2 <- map["shop_image2"]
    }
}

class RestaurantDescription: Mappable {
    var pr_short: String?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        pr_short <- map["pr_short"]
    }
}

class RestaurantAccess: Mappable {
    var line: String?
    var station: String?
    var station_exit: String?
    var walk: String?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        line <- map["line"]
        station <- map["station"]
        station_exit <- map["station_exit"]
        walk <- map["walk"]
    }
}
