//
//  BottomModal.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct NotariaBottomCard: View {
    @Binding var show: Bool
    @Binding var notaria: Notaria
    
    var body: some View {
        VStack {
            NotariaPicker(notaria: $notaria, show: $show)
        }
        .cornerRadius(20)
        .shadow(color: .primary, radius: 15)
        .frame(height: 400)
        .padding([.leading, .trailing])
    }
}
