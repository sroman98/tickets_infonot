//
//  Estado.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 08/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation

class Estado: Identifiable, Codable {
    var id: Int = 0
    var nombre: String = ""
}

extension Estado: Equatable {
    static func == (lhs: Estado, rhs: Estado) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.nombre == rhs.nombre
    }
}

extension Estado: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
