//
//  ButtonWithTitle.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 04/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct ButtonWithTitle: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.thin)
                .padding(.bottom, 4)
            Button("Seleccionar") {
                
            }
        }
    }
}

struct ButtonWithTitle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithTitle(title: "Título")
        .previewLayout(.sizeThatFits)
    }
}
