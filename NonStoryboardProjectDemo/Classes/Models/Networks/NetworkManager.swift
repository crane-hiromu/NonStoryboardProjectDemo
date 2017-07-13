//
//  NetworkManager.swift
//  NonStoryboardProjectDemo
//
//  Created by T.H on 2017/07/06.
//  Copyright © 2017年 T.H. All rights reserved.
//

import Alamofire
import ObjectMapper
import SwiftyJSON

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
//                    switch response.result {
//                    case .success(let result):
//                        DispatchQueue.main.async {
//                            completion(request.fromJson(json: result as AnyObject))
//                        }
//
//                    case .failure(let error):
//                        DispatchQueue.main.async {
//                            completion(.failure(error))
//                        }
//                    }
            }
    }
    
    private let baseUrl = "https://api.gnavi.co.jp"
    private let searchPath = "/RestSearchAPI/20150630/"
    
    func callForSearchRestaurant(_ parameters: Parameters, completion: @escaping ([SearchRestaurantModel]) -> Void) {
        Alamofire.request(baseUrl + searchPath, parameters: parameters)
                .validate(statusCode: successRange)
                .responseJSON { response in
                    guard let result = response.result.value else { return }
                    
                    // いずれmapperを試すために残しておく
                    // var item = Mapper<SearchRestaurantResponse>().map(JSON: result as! [String : Any])

                    let json = JSON(result)
                    let convertArray = self.convertJson(json: json)
                    
                    DispatchQueue.main.async {
                        completion(convertArray)
                    }

        }
    }

    private func convertJson(json: JSON) -> [SearchRestaurantModel] {
        let restaurantObjects = json["rest"]
        var restaurantArray: [SearchRestaurantModel] = []

        for restaurant in restaurantObjects {
            let info = restaurant.1
            let model = SearchRestaurantModel()
 
            model.rest.id = info["id"].stringValue
            model.rest.name = info["name"].stringValue
            model.rest.latitude = info["latitude"].doubleValue
            model.rest.longitude = info["longitude"].doubleValue
            model.rest.category = info["category"].stringValue
            model.rest.coupon_url.pc = info["coupon_url"]["pc"].stringValue
            model.rest.tel = info["tel"].stringValue
            model.rest.pr.pr_short = info["pr"]["pr_short"].stringValue
            model.rest.image_url.shop_image1 = info["image_url"]["shop_image1"].stringValue
            model.rest.image_url.shop_image2 = info["image_url"]["shop_image2"].stringValue
            model.rest.opentime = info["opentime"].stringValue
            model.rest.holiday = info["holiday"].stringValue
            model.rest.access.line = info["access"]["line"].stringValue
            model.rest.access.station = info["access"]["station"].stringValue
            model.rest.access.station_exit = info["access"]["station_exit"].stringValue
            model.rest.access.walk = info["access"]["walk"].stringValue
            model.rest.credit_card = info["credit_card"].stringValue

            restaurantArray.append(model)

            // realm に登録
//            if let id = info["id"].string {
//                restaurantArray[id] = model
//            }
        }
        return restaurantArray
    }

}
