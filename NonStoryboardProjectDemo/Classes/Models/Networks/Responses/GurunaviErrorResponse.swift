//
//  GurunaviErrorResponse.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/08.
//  Copyright © 2017年 T.H. All rights reserved.
//

import ObjectMapper

class GurunaviErrorResponse: Mappable {
    
    var error: ErrorInfomation?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        error <- map["error"]
    }
}

class ErrorInfomation: Mappable {
    
    var message: String?
    var code: String?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        code <- map["code"]
    }
}
