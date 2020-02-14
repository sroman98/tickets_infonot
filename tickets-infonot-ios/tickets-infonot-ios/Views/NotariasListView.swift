//
//  NotariasListView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 09/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation
import SwiftUI

struct NotariasListView: View {
    @EnvironmentObject var ctvm: CreateTicketVM
    var nlvm = NotariasListVM()
    
    var body: some View {
        
        Form {
            ForEach(nlvm.estados) { estado in
                Section(header: Text(estado.nombre)) {
                    ForEach(self.nlvm.edoMunsDict[estado]!) { municipio in
                        Picker(selection: self.$ctvm.notIndex, label: Text(municipio.nombre)) {
                            ForEach(self.nlvm.munNotsDict[municipio]!) { notaria in
                                Text("\(notaria.numero)")
                            }
                            .navigationBarTitle(municipio.nombre)
                        }
                    }
                    .navigationBarTitle("Municipio")
                }
            }
        }
        
    }
}
