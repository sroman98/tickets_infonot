//
//  CreateTicketView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct CreateTicketView: View {
    @ObservedObject private var vm = CreateTicketVM()
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $vm.notIndex, label: Text("Notaría")) {
                    ForEach(vm.notarias) { notaria in
                        Text("\(notaria.numero)").tag(notaria.id)
                    }
                }
                
                Section {
                    Picker(selection: $vm.usIndex, label: Text("Usuario")) {
                        ForEach(vm.usuarios) { usuario in
                            Text("\(usuario.nombre) \(usuario.apellidos)").tag(usuario.id)
                        }
                    }
                    TextField("Nombre", text: $vm.name)
                    TextField("Correo", text: $vm.email)
                    TextField("Teléfono", text: $vm.phone)
                }
                
                Section {
                    Picker(selection: $vm.dptoIndex, label: Text("Departamento")) {
                        ForEach(vm.departamentos) { departamento in
                            Text("\(departamento.nombre)").tag(departamento.id)
                        }
                    }
                    TextField("Asunto", text: $vm.subject)
                    TextField("Descripción", text: $vm.description)
                    Button(action: {print("tapped button")}) {
                        Text("Subir archivo")
                    }
                }
            }
            .navigationBarTitle(Text("Nuevo Ticket"))
        }
    }
}

struct CreateTicketView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTicketView()
    }
}
