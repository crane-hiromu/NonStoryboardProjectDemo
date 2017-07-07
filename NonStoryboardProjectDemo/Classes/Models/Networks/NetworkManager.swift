//
//  NetworkManager.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/06.
//  Copyright © 2017年 T.H. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol ApiPrtocol {
    func callForGurunavi<T, V>(_ request:T, completion: @escaping (Result<V>)  -> Void)
        where T: GurunaviRequestProtocol, V: Mappable, V == T.ResponseType
}

struct NetworkManager: ApiPrtocol {
    private let successRange = 200..<300
    
    func callForGurunavi<T, V>(_ request:T, completion: @escaping (Result<V>)  -> Void)
        where T: GurunaviRequestProtocol, V: Mappable, V == T.ResponseType {
            Alamofire.request(request)
                .validate(statusCode: successRange)
                .responseJSON { response in
                    switch response.result {
                    case .success(let result):
                        DispatchQueue.main.async {
                            completion(request.fromJson(json: result as AnyObject))
                        }

                    case .failure(let error):
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                    
            }
    }
    
}
//
//enum GurunaviResult<Value> {
//    case success(Value)
//    case failure(Error)
//}
