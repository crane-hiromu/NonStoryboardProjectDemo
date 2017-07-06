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
    
    case post(parameters: SearchRestaurantRequestParameters)
    
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
            return [ // 一旦このような形だが、後々検索できるようにするためここは切り出したい。
                "id": parameters.id,
                "format": parameters.format,
                "latitude": parameters.latitude,
                "longitude": parameters.longitude,
                "hit_per_page": parameters.hit_per_page ?? 20,
                "range": parameters.range ?? 2,
                "lang": parameters.lang ?? "ja"
            ]
        }
    }

}

struct SearchRestaurantRequestParameters {
    var id: String = "98a064bc58a5f096041f18968da09199"
    var format: String = "json"
    var latitude: Double
    var longitude: Double
    var hit_per_page: Int? // デフォルトは10件 レスポンス件数
    var range: Int? // デフォルト値は500m [1:300m, 2:500m, 3:1,000m, 4:2,000m, 5:3,000m]
    var lang: String? // デフォルト値は日本語 [ja: 日本語, zh_cn: 中国語 (簡体字), zh_tw: 中国語 (繁体字), ko: 韓国語, en: 英語]
}
