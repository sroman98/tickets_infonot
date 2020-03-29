//
//  NotariaPicker.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 08/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct NotariaPicker: View {
    @Binding var show: Bool
    @Binding var notaria: Notaria
    
    var body: some View {
        VStack {
            EstadoList(notaria: $notaria, show: $show)
        }
        .bottomCard(show: show)
    }
}

struct EstadoList: View {
    @Binding var notaria: Notaria
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MunicipioList(notaria: $notaria, show: $show)) {
                    Text("Estado 1")
                }
                NavigationLink(destination: MunicipioList(notaria: $notaria, show: $show)) {
                    Text("Estado 2")
                }
                NavigationLink(destination: MunicipioList(notaria: $notaria, show: $show)) {
                    Text("Estado 3")
                }
            }
            .navigationBarTitle("Estado")
            .navigationBarItems(trailing: Button("Cancelar") {
                self.show.toggle()
            })
        }
    }
}

struct MunicipioList: View {
    @Binding var notaria: Notaria
    @Binding var show: Bool
    
    var body: some View {
        List {
            
            NavigationLink(destination: NotariaList(notaria: $notaria, show: $show)) {
                Text("Municipio 1")
            }
            NavigationLink(destination: NotariaList(notaria: $notaria, show: $show)) {
                Text("Municipio 2")
            }
            NavigationLink(destination: NotariaList(notaria: $notaria, show: $show)) {
                Text("Municipio 3")
            }
        }
        .navigationBarTitle("Municipio")
        .navigationBarItems(trailing: Button("Cancelar") {
            self.show.toggle()
        })
    }
}

struct NotariaList: View {
    let modelData =
        [Notaria(id: 1, numero: 1, telefono: "4421234567", municipio: Municipio(id: 1, nombre: "Queretaro", estado: Estado(id: 1, nombre: "Queretaro")), direccion: Direccion(id: 1, calle: "Corregidora Nte", numExt: 70, numInt: 104, colonia: "Centro", municipio: Municipio(id: 1, nombre: "Queretaro", estado: Estado(id: 1, nombre: "Queretaro")), cp: 76000), notario: "Juan Perez"),
        Notaria(id: 2, numero: 2, telefono: "4421234567", municipio: Municipio(id: 1, nombre: "Queretaro", estado: Estado(id: 1, nombre: "Queretaro")), direccion: Direccion(id: 1, calle: "Corregidora Nte", numExt: 70, numInt: 104, colonia: "Centro", municipio: Municipio(id: 1, nombre: "Queretaro", estado: Estado(id: 1, nombre: "Queretaro")), cp: 76000), notario: "Juan Perez"),
        Notaria(id: 3, numero: 3, telefono: "4421234567", municipio: Municipio(id: 1, nombre: "Queretaro", estado: Estado(id: 1, nombre: "Queretaro")), direccion: Direccion(id: 1, calle: "Corregidora Nte", numExt: 70, numInt: 104, colonia: "Centro", municipio: Municipio(id: 1, nombre: "Queretaro", estado: Estado(id: 1, nombre: "Queretaro")), cp: 76000), notario: "Juan Perez"),
        Notaria(id: 4, numero: 4, telefono: "4421234567", municipio: Municipio(id: 1, nombre: "Queretaro", estado: Estado(id: 1, nombre: "Queretaro")), direccion: Direccion(id: 1, calle: "Corregidora Nte", numExt: 70, numInt: 104, colonia: "Centro", municipio: Municipio(id: 1, nombre: "Queretaro", estado: Estado(id: 1, nombre: "Queretaro")), cp: 76000), notario: "Juan Perez")]
    
    @Binding var notaria: Notaria
    @Binding var show: Bool
    var body: some View {
        List(modelData) { not in
            Button("\(not.numero)") {
                self.notaria = not
                self.show.toggle()
            }
        }
        .navigationBarTitle("Notaría")
        .navigationBarItems(trailing: Button("Cancelar") {
            self.show.toggle()
        })
    }
}
