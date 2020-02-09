//
//  Direccion.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 08/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation

class Direccion: Identifiable {
    var id: Int = 0
    var calle: String = ""
    var numExt: Int = 0
    var numInt: Int = 0
    var colonia: String = ""
    var cp: Int = 0
    var estado: String = ""
    var municipio: String = ""
}
