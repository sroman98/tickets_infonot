//
//  NotariasListView.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 10/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

struct NotariasListView: View {
    var body: some View {
        
        List {
            Text("1")
            Text("2")
            Text("3")
            Text("4")
        }
        .navigationBarTitle(Text("Notaría"))
        
    }
}

struct NotariasListView_Previews: PreviewProvider {
    static var previews: some View {
        NotariasListView()
    }
}
