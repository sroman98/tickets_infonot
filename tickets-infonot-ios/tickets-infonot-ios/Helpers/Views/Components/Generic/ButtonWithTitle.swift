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
    let selectedText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.thin)
            
            if selectedText == "" {
                Button("Seleccionar") {
                    self.action()
                }
            } else {
                HStack {
                    Text(selectedText)
                        
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
