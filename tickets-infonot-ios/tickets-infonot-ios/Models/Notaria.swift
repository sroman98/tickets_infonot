//
//  Notaria.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 13/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation

struct Notaria: Identifiable {
    var id: Int = 0
    var numero: Int = 0
    var telefono: String = ""
    var municipio: Municipio = Municipio()
    var direccion: Direccion = Direccion()
    var notario: String = ""
}
