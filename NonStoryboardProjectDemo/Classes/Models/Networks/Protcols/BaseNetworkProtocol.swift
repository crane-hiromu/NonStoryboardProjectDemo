//
//  BaseNetworkProtocol.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/07.
//  Copyright © 2017年 T.H. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol BaseNetworkProtocol {
    associatedtype ResponseType

    var method: HTTPMethod { get }
    var baseURL: String { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
}
