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

extension Municipio: Equatable {
    static func == (lhs: Municipio, rhs: Municipio) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.nombre == rhs.nombre &&
            lhs.estado == rhs.estado
    }
}
