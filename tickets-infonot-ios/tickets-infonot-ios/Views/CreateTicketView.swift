//
//  CreateTicketView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct CreateTicketView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            NavigationView {
                VStack(spacing: 40) {
                    VStack(alignment: .leading) {
                        Text("Información de contacto")
                            .subtitle()
                            .padding(.bottom, 5)
                        TextFieldWithTitle(title: "Nombre", placeholder: "Juana Pérez", value: $viewModel.nombre)
                        TextFieldWithTitle(title: "Correo", placeholder: "juana@notaria01.com", value: $viewModel.correo)
                        HStack {
                            TextFieldWithTitle(title: "Teléfono", placeholder: "(442) 123-4567", value: $viewModel.telefono)
                            ButtonWithTitle(title: "Notaría", action: {
                                self.viewModel.showNotPicker.toggle()
                            }, selectedText: viewModel.notaria.id == 0 ? "" : "\(viewModel.notaria.municipio.nombre) \(viewModel.notaria.numero)")
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
                        MultilineTFWithTitle(title: "Descripción", placeholder: "Describe aquí el problema...", lines: 4, value: $viewModel.descripcion)
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
            .disabled(viewModel.showDptoPicker || viewModel.showNotPicker)
            
            NotariaBottomCard(show: $viewModel.showNotPicker, notaria: $viewModel.notaria)
                .offset(y: viewModel.showNotPicker ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 0.3))
                .disabled(viewModel.showDptoPicker)
            
            DepartamentoBottomCard(show: $viewModel.showDptoPicker, departamento: $viewModel.departamento)
                .offset(y: viewModel.showDptoPicker ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 0.3))
                .disabled(viewModel.showNotPicker)
        }
    }
}

struct CreateTicketView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTicketView(viewModel: CreateTicketView.ViewModel())
    }
}
