//
//  MunicipiosListView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 09/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation
import SwiftUI

struct municipiosListView: View {
    @ObservedObject var mlvm = MunicipiosListVM()
    
    var body: some View {
        Form {
            ForEach(mlvm.estados) { estado in
                Section(header: Text(estado.nombre)) {
                    ForEach(self.mlvm.edoMunsDict[estado]!) { municipio in
                        Picker(selection: self.$mlvm.notIndex, label: Text(municipio.nombre)) {
                            ForEach(self.mlvm.munNotsDict[municipio]!) { notaria in
                                Text("\(notaria.numero)")
                            }
                            .navigationBarTitle(municipio.nombre)
                        }
                        
                    }
                }
            }
        }.navigationBarTitle("Municipio")
    }
}
