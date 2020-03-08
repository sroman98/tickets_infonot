//
//  BottomModal.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct BottomModal: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Estado")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Button("Cancelar") {
                        self.show.toggle()
                    }
                        .padding(4)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .padding()
                
              Text("This is the text content on the bottom card.")
                .foregroundColor(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                
              Spacer()
            }
        }
        .background(Color.blue)
        .cornerRadius(15)
        .shadow(radius: 15)
        .frame(height: 300)
    }
}
