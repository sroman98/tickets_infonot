//
//  Card.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 29/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

extension View {
    func card(show: Bool) -> some View {
        self
            .cornerRadius(20)
            .shadow(color: .primary, radius: 15)
            .frame(height: 400)
            .padding([.leading, .trailing])
            .offset(y: show ? 0 : UIScreen.main.bounds.height)
            .animation(.easeInOut(duration: 0.3))
    }
}
