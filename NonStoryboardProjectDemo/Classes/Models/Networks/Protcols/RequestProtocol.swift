//
//  RequestProtocol.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/07.
//  Copyright © 2017年 T.H. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol RequestProtocol: BaseNetworkProtocol, URLRequestConvertible {
    associatedtype ResponseType
    
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }

}

extension RequestProtocol {
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.timeoutInterval = TimeInterval(30)
        urlRequest = try encoding.encode(urlRequest, with: parameters)
        
        return urlRequest
    }
    
}
