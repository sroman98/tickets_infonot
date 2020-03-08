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
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.thin)
                .padding(.bottom, 4)
            Button("Seleccionar") {
                self.action()
            }
        }
    }
}
