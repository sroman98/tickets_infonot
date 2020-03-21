//
//  CreateTicketView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct CreateTicketView: View {
    @State var nombre = ""
    @State var correo = ""
    @State var telefono = ""
    @State var showNotPicker = false
    @State var notaria: Notaria
    @State var showDptoPicker = false
    @State var departamento: Departamento
    @State var asunto = ""
    @State var descripcion = ""
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            NavigationView {
                VStack(spacing: 40) {
                    VStack(alignment: .leading) {
                        Text("Información de contacto")
                            .subtitle()
                            .padding(.bottom, 5)
                        TextFieldWithTitle(title: "Nombre", placeholder: "Juana Pérez", value: $nombre)
                        TextFieldWithTitle(title: "Correo", placeholder: "juana@notaria01.com", value: $correo)
                        HStack {
                            TextFieldWithTitle(title: "Teléfono", placeholder: "(442) 123-4567", value: $telefono)
                            ButtonWithTitle(title: "Notaría", action: {
                                self.showNotPicker.toggle()
                            }, selectedText: notaria.id == 0 ? "" : "\(notaria.municipio.nombre) \(notaria.numero)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("Información del problema")
                            .subtitle()
                            .padding(.bottom, 5)
                        ButtonWithTitle(title: "Departamento", action: {
                            self.showDptoPicker.toggle()
                        }, selectedText: departamento.nombre)
                            .padding(.bottom, 8)
                        TextFieldWithTitle(title: "Asunto", placeholder: "Resumen del problema", value: $asunto)
                        MultilineTFWithTitle(title: "Descripción", placeholder: "Describe aquí el problema...", lines: 4, value: $descripcion)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .navigationBarTitle("Nuevo Ticket")
                .navigationBarItems(trailing:
                    Button("Enviar") {
                    
                    }
                )
            }
            .disabled(showDptoPicker || showNotPicker)
            
            NotariaBottomCard(show: $showNotPicker, notaria: $notaria)
                .offset(y: showNotPicker ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 0.3))
                .disabled(showDptoPicker)
            
            DepartamentoBottomCard(show: $showDptoPicker, departamento: $departamento)
                .offset(y: showDptoPicker ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 0.3))
                .disabled(showNotPicker)
        }
    }
}

struct CreateTicketView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTicketView(notaria: Notaria(), departamento: Departamento())
    }
}
