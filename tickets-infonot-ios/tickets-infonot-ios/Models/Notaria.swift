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

struct Notaria: Identifiable, Codable {
    var id: Int
    var numero: Int
    var telefono: String
    var notario: String
    var municipio: Municipio
    var direccion: Direccion
}

extension Notaria: Equatable {
    static func == (lhs: Notaria, rhs: Notaria) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.numero == rhs.numero &&
            lhs.telefono == rhs.telefono &&
            lhs.notario == rhs.notario &&
            lhs.municipio == rhs.municipio
    }
}

extension Notaria: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
