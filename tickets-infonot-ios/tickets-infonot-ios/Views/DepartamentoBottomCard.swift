//
//  DepartamentoBottomCard.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 20/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct DepartamentoBottomCard: View {
    @Binding var show: Bool
    @Binding var departamento: Departamento
    
    var body: some View {
        VStack {
            DepartamentoPicker(departamento: $departamento, show: $show)
        }
        .cornerRadius(20)
        .shadow(color: .primary, radius: 20)
        .frame(height: 400)
        .padding([.leading, .trailing])
    }
}
