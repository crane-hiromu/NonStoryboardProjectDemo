//
//  SearchRestaurantRequest.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/07.
//  Copyright © 2017年 T.H. All rights reserved.
//

import Alamofire
import ObjectMapper

enum SearchRestaurantRequest: GurunaviRequestProtocol {
    typealias ResponseType = SearchRestaurantResponse
    
    case post(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .post: return .post
        }
    }
    
    var path: String {
        return "/RestSearchAPI/20150630/"
    }
    
    var parameters: Parameters? {
        switch self {
        case .post(let parameters):
            return parameters
        }
    }

}

/// 'ぐるなびAPI'のリクエストのキー名をそのまま使用しているため、スネークケースのものがある
struct SearchRestaurantRequestParameters {
    var latitude: Double
    var longitude: Double
    var hit_per_page: Int
    var range: Int

    var parameters: Parameters {
        var parameters = Parameters()
        parameters["keyid"] = "98a064bc58a5f096041f18968da09199"
        parameters["format"] = "json"
        parameters["latitude"] = latitude
        parameters["longitude"] = longitude
        parameters["hit_per_page"] = hit_per_page
        parameters["range"] = range
        return parameters
    }

    /// ぐるなびレストラン検索パラメータ
    /// - parameter latitude: 緯度
    /// - parameter longitude: 軽度
    /// - parameter hit_per_page: レスポンス件数　デフォルト値10件
    /// - parameter range: 範囲 デフォルト値は500m [1:300m, 2:500m, 3:1,000m, 4:2,000m, 5:3,000m]
    init(latitude: Double,
         longitude: Double,
         hit_per_page: Int = 20, //  デフォルトの10件は少ないので20件を設定
         range: Int = 2){
        self.latitude = latitude
        self.longitude = longitude
        self.hit_per_page = hit_per_page
        self.range = range
    }
}
