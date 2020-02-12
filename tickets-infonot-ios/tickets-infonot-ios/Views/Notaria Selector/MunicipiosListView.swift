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
    var notarias = [Notaria]()
    @State var notIndex = 0
    
    var body: some View {
        Form {
            ForEach(mlvm.estados) { estado in
                Section(header: Text(estado.nombre)) {
                    ForEach(self.mlvm.edoMunDict[estado]!) { municipio in
                        Picker(selection: self.$notIndex, label: Text(municipio.nombre)) {
                            ForEach(self.notarias) { notaria in
                                if notaria.municipio == municipio {
                                    Text("\(notaria.numero)")
                                }
                            }
                        }
                    }
                }
            }
        }.navigationBarTitle("Municipio")
    }
}
