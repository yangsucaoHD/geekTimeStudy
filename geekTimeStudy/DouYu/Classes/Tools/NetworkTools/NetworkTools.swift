//
//  NetworkTools.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/22.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit
import Alamofire

enum NetworkMethodType {
    case GET
    case POST
}

class NetworkTools {
    class func requestData(type: NetworkMethodType, url: URLConvertible, param: [String : Any]? = nil, finishedBolock: @escaping (_ result : AnyObject)->()) {
        let methodType = type == .GET ? HTTPMethod.get :  HTTPMethod.post
        Alamofire.request(url, method: methodType, parameters: param).responseJSON { (response) in
            guard let result = response.result.value else {
                //                print(response.result.error)
                return
            }
            //            print(result)
            finishedBolock(result as AnyObject)
        }
    }
}
