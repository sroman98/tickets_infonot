//
//  Usuario.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class Usuario: Identifiable {
    var id: Int = 0
    var correo: String = ""
    var nombre: String = ""
    var apellidos: String = ""
    var telefono: String = ""
    var photo: Data?
    var idNotaria: Int?
    var idDepartamento: Int?
    var idRol: Int?
    var created_at: Date = Date()
    var updated_at: Date = Date()
}
