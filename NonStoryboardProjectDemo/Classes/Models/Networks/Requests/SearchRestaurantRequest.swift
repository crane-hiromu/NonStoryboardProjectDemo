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
