//
//  CreateTicketView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct CreateTicketView: View {
    @EnvironmentObject var vm: CreateTicketVM
    
    var body: some View {
        NavigationView {
            Form {
                List {
                    NavigationLink(destination: NotariasListView()) {
                        HStack {
                            Text("Notaria")
                            Spacer()
                            if vm.notIndex != 0 {
                                Text("\(vm.notaria.municipio.nombre) \(vm.notaria.numero)")
                                .foregroundColor(Color.gray)
                            }
                            
                        }
                    }
                }
                
                if vm.notIndex != 0 {
                    Section {
                        Picker(selection: $vm.usIndex, label: Text("Usuario")) {
                            ForEach(vm.usuarios) { usuario in
                                Text("\(usuario.nombre) \(usuario.apellidos)").tag(usuario.id)
                            }
                        }
                        if vm.usIndex == 0 {
                            TextField("Nombre", text: $vm.name)
                            TextField("Correo", text: $vm.email)
                            TextField("Teléfono", text: $vm.phone)
                        } else {
                            Button(action: {self.vm.usIndex = 0}) {
                                Text("No tengo usuario")
                            }
                        }
                    }
                }
                
                if vm.usIndex != 0 || !(vm.name.isEmpty || vm.email.isEmpty || vm.phone.isEmpty) {
                    Section {
                        Picker(selection: $vm.dptoIndex, label: Text("Departamento")) {
                            ForEach(vm.dptos) { departamento in
                                Text("\(departamento.nombre)").tag(departamento.id)
                            }
                        }
                        TextField("Asunto", text: $vm.subject)
                        TextField("Descripción", text: $vm.description)
                        Button(action: {print("tapped button")}) {
                            Text("Adjuntar archivo")
                        }
                    }
                }
                
            }
            .navigationBarTitle("Nuevo Ticket")
            .navigationBarItems(trailing:
                Button(action: {
                    self.vm.createTicket()
                }) {
                    Text("Enviar")
                }.disabled(vm.subject.isEmpty || vm.description.isEmpty || vm.dptoIndex == 0)
            )
        }
    }
}

struct CreateTicketView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTicketView()
            .environmentObject(CreateTicketVM())
    }
}
