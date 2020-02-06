//
//  ContentView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 05/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = "";
    @State private var email: String = "";
    @State private var phone: String = "";
    @State private var subject: String = "";
    @State private var description: String = "";
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: .constant(0), label: Text("Notaría")) {
                    Text("Not 1 Qro").tag(1)
                    Text("Not 2 Qro").tag(2)
                }

                TextField("Nombre", text: $name)
                TextField("Correo", text: $email)
                TextField("Teléfono", text: $phone)
                TextField("Asunto", text: $subject)
                
                Picker(selection: .constant(0), label: Text("Departamento")) {
                    Text("Soporte técnico").tag(1)
                    Text("Ventas").tag(2)
                }
                
                TextField("Descripción", text: $description)
                
                Button(action: {print("tapped button")}) {
                    Text("Subir archivo")
                }
            }
            .navigationBarTitle(Text("Nuevo Ticket"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
