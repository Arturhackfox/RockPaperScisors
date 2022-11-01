//
//  Button.swift
//  PaperRockScisors
//
//  Created by Arthur Sh on 31.10.2022.
//

import SwiftUI

struct CustomB: ViewModifier {
  
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
            .background(.green)
            .cornerRadius(12)
    }
}



extension View {
    func CustomButton () -> some View {
        modifier(CustomB())
    }
}
