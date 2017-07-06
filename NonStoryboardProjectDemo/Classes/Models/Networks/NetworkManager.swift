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
    func callForGurunavi<T: GurunaviRequestProtocol, V: Mappable>(_ request:T, completion: @escaping (Result<V>)  -> Void) where V == T.ResponseType
}

struct NetworkManager: ApiPrtocol {
    private let statusCodeRange = 200..<300
    
    func callForGurunavi<T: GurunaviRequestProtocol, V: Mappable>(_ request:T, completion: @escaping (Result<V>)  -> Void) where V == T.ResponseType {
        Alamofire.request(request)
            .validate(statusCode: statusCodeRange)
            .responseJSON{ (response: DataResponse<V>) in
                switch response.result {
                case .success(let result):
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            
        }
    }
    
}
