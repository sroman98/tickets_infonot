//
//  CreateTicketView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct CreateTicketView: View {
    @State var text = ""
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Información de contacto")
                        .subtitle()
                        .padding(.bottom, 5)
                    TextFieldWithTitle(title: "Nombre", placeholder: "Juana Pérez", value: $text)
                    TextFieldWithTitle(title: "Correo", placeholder: "juana@notaria01.com", value: $text)
                    HStack {
                        TextFieldWithTitle(title: "Teléfono", placeholder: "(442) 123-4567", value: $text)
                        ButtonWithTitle(title: "Notaría")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Información del problema")
                        .subtitle()
                        .padding(.bottom, 5)
                    ButtonWithTitle(title: "Departamento")
                        .padding(.bottom, 8)
                    TextFieldWithTitle(title: "Asunto", placeholder: "Resumen del problema", value: $text)
                    MultilineTFWithTitle(title: "Descripción", placeholder: "Describe aquí el problema...", lines: 4, value: $text)
                        
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
    }
}

struct CreateTicketView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTicketView()
    }
}
