//
//  GurunaviRequestProtocol.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/07.
//  Copyright © 2017年 T.H. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol GurunaviRequestProtocol: RequestProtocol {}

extension GurunaviRequestProtocol {
    
    var baseURL: String {
        return "https://api.gnavi.co.jp"
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
