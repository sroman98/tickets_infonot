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
    @State private var filteredMuns = [Municipio]()
    var estado = Estado()
    
    var body: some View {
        
        List {
            ForEach(mlvm.estados) { estado in
                Section(header: Text(estado.nombre)) {
                    ForEach(self.mlvm.edoMunDict[estado]!) { municipio in
                        NavigationLink(destination: NotariasListView()) {
                            Text(municipio.nombre)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text("Municipio"))
        
    }
}
