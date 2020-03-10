//
//  NotariaPicker.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 08/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct NotariaPicker: View {
    @Binding var notaria: Notaria
    @Binding var show: Bool
    
    var body: some View {
        EstadoList(notaria: $notaria, show: $show)
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
    let modelData: [Notaria] =
        [Notaria(notaria: "Not 1"),
        Notaria(notaria: "Not 2"),
        Notaria(notaria: "Not 3"),
        Notaria(notaria: "Not 4")]
    @Binding var notaria: Notaria
    @Binding var show: Bool
    var body: some View {
        List(modelData) { not in
            Button(not.notaria) {
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
