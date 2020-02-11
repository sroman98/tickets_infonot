//
//  CreateTicketController.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 09/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

class MunicipiosListVM: ObservableObject {
    var municipios = [Municipio]()
    var estados = [Estado]()
    var filteredMuns = [Municipio]()
    
    @Published var edoMunDict = [Estado: [Municipio]]()
    
    var municipioIndex: Int = 0
    
    init() {
        Catalogs.shared.getMunicipios { munArray in
            self.municipios = munArray
            Catalogs.shared.getEstados { edoArray in
                self.estados = edoArray
                for estado in self.estados {
                    self.filteredMuns = self.municipios.filter({ mun -> Bool in
                        mun.estado == estado
                    })
                    self.edoMunDict[estado] = self.filteredMuns
                }
                 
            }
        }
        
    }
}
