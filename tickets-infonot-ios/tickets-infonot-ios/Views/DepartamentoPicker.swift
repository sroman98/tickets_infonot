//
//  DepartamentoPicker.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 20/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct DepartamentoPicker: View {
    let modelData =
        [
            Departamento(id: 1, nombre: "Soporte técnico"),
            Departamento(id: 2, nombre: "Ventas"),
            Departamento(id: 3, nombre: "Respaldos")
        ]
    
    @Binding var departamento: Departamento
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            List(modelData) { dpto in
                Button(dpto.nombre) {
                    self.departamento = dpto
                    self.show.toggle()
                }
            }
            .navigationBarTitle("Departamento")
            .navigationBarItems(trailing: Button("Cancelar") {
                self.show.toggle()
            })
        }
        
    }
}
