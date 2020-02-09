//
//  Municipio.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 08/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation

class Municipio: Identifiable, Codable {
    var id: Int = 0
    var nombre: String = ""
    var estado: Estado = Estado()
}
