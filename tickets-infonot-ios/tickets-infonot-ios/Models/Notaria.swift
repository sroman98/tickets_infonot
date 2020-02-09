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
