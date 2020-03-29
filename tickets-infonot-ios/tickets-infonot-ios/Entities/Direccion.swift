//
//  Direccion.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 13/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation

struct Direccion: Identifiable {
    var id: Int = 0
    var calle: String = ""
    var numExt: Int = 0
    var numInt: Int?
    var colonia: String = ""
    var municipio: Municipio = Municipio()
    var cp: Int = 0
}
