//
//  Notaria.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class Notaria: Identifiable {
    let id: Int = 0
    var numero: Int = 0
    var telefono: String = ""
    var idMunicipio: Int = 0
    var idDireccion: Int = 0
    var notario: String = ""
    var created_at: Date = Date()
    var updated_at: Date = Date()
}
