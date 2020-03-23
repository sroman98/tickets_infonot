//
//  CreateTicketVM.swift
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
        @Published var telefono = ""
        @Published var showNotPicker = false
        @Published var notaria = Notaria()
        @Published var showDptoPicker = false
        @Published var departamento = Departamento()
        @Published var asunto = ""
        @Published var descripcion = ""
        
//        private let service: WebService
        
//        func loadSomething() {
//            service.getCountries { [weak self] result in
//                self?.countries = result.value ?? []
//            }
//        }
    }
}
