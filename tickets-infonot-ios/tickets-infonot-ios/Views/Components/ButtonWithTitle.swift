//
//  ButtonWithTitle.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 04/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

typealias VoidHandler = ()  -> Void

struct ButtonWithTitle: View {
    let title: String
    let action: VoidHandler
    let notaria: Notaria
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.thin)
            
            if notaria.notaria == "" {
                Button("Seleccionar") {
                    self.action()
                }
            } else {
                HStack {
                    Text(notaria.notaria)
                        
                    Button(action: {
                        self.action()
                    }) {
                        Image(systemName: "pencil")
                    }
                }
                .padding(.top, -10)
            }
            
            
        }
        .padding(.bottom, -4)
    }
}
