//
//  MultilineTFWithTitle.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct MultilineTFWithTitle: View {
    var title: String
    var placeholder: String
    var lines: Int
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.thin)
                .padding(.bottom, -10)
            MultilineTextField(placeholder: placeholder, text: $value)
                .frame(lines: lines)
        }
    }
}
