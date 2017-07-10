//
//  SearchRestaurantModel.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/09.
//  Copyright © 2017年 T.H. All rights reserved.
//

/// 'ぐるなびAPI'のレスポンスのキー名をそのまま使用しているため、スネークケースのものがある
class SearchRestaurantModel {
    var rest: RestaurantInfo = RestaurantInfo()
    
    // 以下、レスポンスには含まれない情報、アプリで管理するもの
    var favoriteFlag: Bool = false
    var wantToGoFlag: Bool = false // haveEnteredFlagがtrueの時は必ずfalseになる
    var haveEnteredFlag: Bool = false
}

class RestaurantInfo {
    var id: String = ""
    var name: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var category: String = ""
    var coupon_url: InfoCoupon = InfoCoupon()
    var tel: String = ""
    var pr: InfoDescription = InfoDescription()
    var image_url: InfoImage = InfoImage()
    var opentime: String? = nil
    var holiday: String? = nil
    var access: InfoAccess = InfoAccess()
    var lunch: Int? = 0
    var credit_card: String? = nil
}

class InfoCoupon {
    var pc: String? = nil
}

class InfoDescription {
    var pr_short: String? = nil
}

class InfoImage {
    var shop_image1: String? = nil
    var shop_image2: String? = nil
}

class InfoAccess {
    var line: String? = nil
    var station: String? = nil
    var station_exit: String? = nil
    var walk: String? = nil
}
