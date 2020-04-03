//
//  CreateTicketViewModel.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 23/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

extension CreateTicketView {
    class ViewModel: ObservableObject {
        @Published var nombre = ""
        @Published var correo = ""
        @Published var telefono = "" {
            didSet {
                if telefono.count > 10 {
                    telefono = oldValue
                    UIApplication.shared.endEditing()
                }
            }
        }
        @Published var showNotPicker = false
        @Published var notaria = Notaria()
        @Published var showDptoPicker = false
        @Published var departamento = Departamento()
        @Published var asunto = ""
        @Published var descripcion = ""
        
        var disableForm: Bool {
            !isValidForm()
        }
        
        func isValidForm() -> Bool {
            return isValidNombre() && isValidCorreo() && isValidTelefono() && isValidNotaria() && isValidDepartamento() && isValidAsunto() && isValidDescripcion()
        }
        
        func isValidNombre() -> Bool {
            if nombre.isEmpty {
                return false
            }
            return true
        }
        func isValidCorreo() -> Bool {
            let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", EMAIL_REGEX)
            return emailTest.evaluate(with: correo)
        }
        func isValidTelefono() -> Bool {
            let phoneTest = NSPredicate(format:"SELF MATCHES[c] %@", PHONE_REGEX)
            return phoneTest.evaluate(with: telefono)
        }
        func isValidNotaria() -> Bool {
            if notaria.id == 0 {
                return false
            }
            return true
        }
        func isValidDepartamento() -> Bool {
            if departamento.id == 0 {
                return false
            }
            return true
        }
        func isValidAsunto() -> Bool {
            if asunto.isEmpty {
                return false
            }
            return true
        }
        func isValidDescripcion() -> Bool {
            if descripcion.isEmpty {
                return false
            }
            return true
        }
    }
}
