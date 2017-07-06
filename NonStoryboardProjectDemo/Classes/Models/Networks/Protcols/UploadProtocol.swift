//
//  UploadProtocol.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/07.
//  Copyright © 2017年 T.H. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol UploadProtocol: BaseNetworkProtocol {
    associatedtype ResponseType
    
    var multipartFormData: (MultipartFormData) -> () { get }
    
}
