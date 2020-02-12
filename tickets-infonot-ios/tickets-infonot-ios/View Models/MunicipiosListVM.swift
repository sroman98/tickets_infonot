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
    var notarias = [Notaria]()
    var filteredMuns = [Municipio]()
    var filteredNots = [Notaria]()
    
    @Published var edoMunsDict = [Estado: [Municipio]]()
    @Published var munNotsDict = [Municipio: [Notaria]]()
    
    var notIndex = 0
    
    init() {
        Catalogs.shared.getMunicipios { munArray in
            self.municipios = munArray
            Catalogs.shared.getEstados { edoArray in
                self.estados = edoArray
                Catalogs.shared.getNotarias { notArray in
                self.notarias = notArray
                    self.setEdoMunsDict()
                }
            }
        }
    }
    
    func setEdoMunsDict() {
        for estado in self.estados {
            self.filteredMuns = self.municipios.filter({ mun -> Bool in
                mun.estado == estado
            })
            self.edoMunsDict[estado] = self.filteredMuns
            setMunNotsDict()
        }
    }
    
    func setMunNotsDict() {
        for municipio in self.filteredMuns {
            self.filteredNots = self.notarias.filter({ not -> Bool in
                not.municipio == municipio
            })
            self.munNotsDict[municipio] = self.filteredNots
        }
    }
}
