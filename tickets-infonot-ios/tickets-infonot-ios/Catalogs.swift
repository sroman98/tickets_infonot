//
//  File.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation

let sharedCatalogs = Catalogs()

class Catalogs {

    // MARK: - Properties
    private var notarias: [Notaria]
    private var usuarios: [Usuario]
    private var departamentos: [Departamento]

    // Initialization
    init() {
        self.notarias =
        self.usuarios =
        self.departamentos =
    }
    
    static func update(catalog: String, array?: [Any]) {
        
    }
}
