//
//  MultilineTextField.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/03/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import SwiftUI
import Foundation

struct MultilineTextField: UIViewRepresentable {
    typealias UIViewType = UITextView
    let FONT_SIZE: CGFloat = 17
    
    var placeholder: String
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<MultilineTextField>) -> UITextView {
        let textView = UITextView()
        
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        textView.font = UIFont.systemFont(ofSize: FONT_SIZE)
        
        textView.text = placeholder
        textView.textColor = .placeholderText
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultilineTextField>) {
        if text != "" || uiView.textColor == .label {
            uiView.text = text
            uiView.textColor = .label
        }
        uiView.delegate = context.coordinator
    }
    
    func frame(lines: Int) -> some View {
        let numLines = CGFloat(lines)
        let height = UIFont.systemFont(ofSize: FONT_SIZE).lineHeight * numLines
        return self.frame(height: height)
    }
    
    func makeCoordinator() -> MultilineTextField.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextField
        
        init(_ parent: MultilineTextField) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = ""
                textView.textColor = .label
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == "" {
                textView.text = parent.placeholder
                textView.textColor = .placeholderText
            }
        }
    }
}
