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
    }
}