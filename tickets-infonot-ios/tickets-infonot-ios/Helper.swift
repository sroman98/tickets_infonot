//
//  Helper.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation

func sendRequest(path: String, method: String, parameters: [String:Any]) {
    let headers = [
        "Content-Type" : "application/x-www-form-urlencoded"
    ]
    Alamofire.request(API_HOST+path, method:.post, parameters:parameters, encoding: URLEncoding.httpBody, headers: headers).responseData
    { response
        return response
    }
}
