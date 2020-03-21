//
//  Subtitle.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 03/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI

extension Text {
    func subtitle() -> Text {
        self
            .font(.title)
            .fontWeight(.thin)
        .underline()
//            .foregroundColor(Color.blue)
    }
}
