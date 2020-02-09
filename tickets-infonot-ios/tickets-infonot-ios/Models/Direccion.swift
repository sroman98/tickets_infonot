//
//  Direccion.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 08/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation

class Direccion: Identifiable, Codable {
    var id: Int = 0
    var calle: String = ""
    var numExt: Int = 0
    var numInt: Int?
    var colonia: String = ""
    var cp: Int = 0
    var municipio: Municipio = Municipio()
}
