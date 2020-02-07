//
//  Helper.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation
import Alamofire



func sendRequest(path: String, method: HTTPMethod, parameters: [String:Any], completion: @escaping (AFDataResponse<Data?>) -> Void) {
    let headers = HTTPHeaders.init(["Content-Type" : "application/x-www-form-urlencoded"])

    AF.request(API_HOST+path, method: method, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).response { response in
        completion(response)
    }
}
