//
//  TextFieldWithTitle.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 03/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct TextFieldWithTitle: View {
    var title: String
    var placeholder: String
    @Binding var value: String
    var contentType: UITextContentType?
    var keyboardType: UIKeyboardType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.thin)
                .padding(.bottom, -10)
            TextField(placeholder, text: $value)
                .textContentType(contentType)
                .keyboardType(keyboardType ?? .default)
        }
    }
}
