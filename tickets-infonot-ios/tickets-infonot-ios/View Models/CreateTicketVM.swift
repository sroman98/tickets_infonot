//
//  CreateTicketController.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class CreateTicketVM: ObservableObject {
    var notarias = [Notaria]()
    var usuarios = [Usuario]()
    var departamentos = [Departamento]()
    
    var notIndex = 0
    var usIndex = 0
    var dptoIndex = 0
    
    var name: String = ""
    var email: String = ""
    var phone: String = ""
    var subject: String = ""
    var description: String = ""
    
    func createTicket() {
        
    }
    
    func sendRequest() {
        let headers = [
            "Content-Type" : "application/x-www-form-urlencoded"
        ]
        let params = [
            "username":email,
            "first_name":name,
            "last_name":lname,
            "email":email,
            "password":password
        ] as [String:Any]
        Alamofire.request(API_HOST+"/users/", method:.post, parameters:params, encoding: URLEncoding.httpBody, headers: headers).responseData
        { response in switch response.result {
            case .success(let data):
                switch response.response?.statusCode ?? -1 {
                    case 200:
                        stop = false
                        self.didSignedUser(userData: data)
                    case 400:
                        Helper.showAlert(viewController: self, title: "¡Ups!", message: "Por favor llena todos los campos")
                    case 401:
                        Helper.showAlert(viewController: self, title: "¡Ups!", message: "Ya existe una cuenta con el correo que ingresaste")
                    default:
                        Helper.showAlert(viewController: self, title: "¡Ups!", message: "Error inesperado")
                }
            case .failure(let error):
                Helper.showAlert(viewController: self,title: "¡Ups!",message: error.localizedDescription)
            }
            if self.actInd != nil && stop {
                Helper.stopActivityIndicator(actInd: self.actInd!)
            }
        }
    }
}
