//
//  CreateTicketView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct CreateTicketView: View {
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            NavigationView {
                VStack(spacing: 40) {
                    VStack(alignment: .leading) {
                        Text("Información de contacto")
                            .subtitle()
                            .padding(.bottom, 5)
                        TextFieldWithTitle(title: "Nombre", placeholder: "Juana Pérez", value: $viewModel.nombre, contentType: .name)
                        TextFieldWithTitle(title: "Correo", placeholder: "juana@notaria01.com", value: $viewModel.correo, contentType: .emailAddress, keyboardType: .emailAddress)
                        HStack {
                            TextFieldWithTitle(title: "Teléfono", placeholder: "(442) 123-4567", value: $viewModel.telefono, contentType: .telephoneNumber, keyboardType: .phonePad)
                            ButtonWithTitle(title: "Notaría", action: {
                                self.viewModel.showNotPicker.toggle()
                            }, selectedText: viewModel.notaria.getName())
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("Información del problema")
                            .subtitle()
                            .padding(.bottom, 5)
                        ButtonWithTitle(title: "Departamento", action: {
                            self.viewModel.showDptoPicker.toggle()
                        }, selectedText: viewModel.departamento.nombre)
                            .padding(.bottom, 8)
                        TextFieldWithTitle(title: "Asunto", placeholder: "Resumen del problema", value: $viewModel.asunto)
                        MultilineTFWithTitle(title: "Descripción", placeholder: "Describe aquí el problema...", lines: 3.5, value: $viewModel.descripcion)
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
            .offset(y: -keyboardResponder.currentHeight*0.5)
            .disabled(viewModel.showDptoPicker || viewModel.showNotPicker)
            
            NotariaPicker(show: $viewModel.showNotPicker, notaria: $viewModel.notaria)
            
            DepartamentoPicker(show: $viewModel.showDptoPicker, departamento: $viewModel.departamento)
        }
    }
}

struct CreateTicketView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTicketView()
    }
}
