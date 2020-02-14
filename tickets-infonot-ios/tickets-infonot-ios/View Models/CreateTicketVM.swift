//
//  CreateTicketController.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

class CreateTicketVM: ObservableObject {
    @Published var notIndex: Int = 0
    var notarias = [Notaria]()
    var notaria: Notaria {
        return notarias.first { notaria -> Bool in
            notaria.id == notIndex
        }!
    }
    
    var usIndex = 0
    var usuarios = [Usuario]()
    var name: String = ""
    var email: String = ""
    var phone: String = ""
    
    var dptoIndex = 0
    var dptos = [Departamento]()
    var subject: String = ""
    var description: String = ""
    var file: String = ""
    
    init() {
        Catalogs.shared.getNotarias { notarias in
            self.notarias = notarias
        }
    }
    
    private func isValidForm() -> String {
        if subject.isEmpty {
            return "Por favor llena todos los campos"
        }
        if dptoIndex == 0 || notIndex == 0 {
            return "Por favor selecciona una notaría y un departamento"
        }
        if file.isEmpty && description.isEmpty {
            return "Por favor agrega una descripción o sube un archivo"
        }
        if notIndex == 0 {
            if name.isEmpty || phone.isEmpty || email.isEmpty {
                return "Por favor ingresa tus datos de contacto"
            }
            if !(Helper.isValidEmail(email: email) || Helper.isValidPhone(phone: phone)) {
                return "Por favor ingresa un teléfono o email válido"
            }
        }
        return ""
    }
    
    func createTicket() {
        let error = isValidForm()
        if  error == "" {
            let parameters: [String: Any] = ["asunto": subject, "descripcion": description, "idDepartamento": dptoIndex, "idNotaria": notIndex, "idUsuario": usIndex, "nombre": name, "telefono": phone, "correo": email]
            Helper.sendRequest(path: "/tickets", method: .post, parameters: parameters) { response in
                print(response)
            }
        } else {
            print(error)
        }
    }
}
