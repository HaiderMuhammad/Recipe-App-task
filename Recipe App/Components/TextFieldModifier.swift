//
//  TextFieldModifier.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import Foundation
import SwiftUI


struct RecipeTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 15)
            .padding(.vertical, 12)
            .background(.background, in: .rect(cornerRadius: 10))
    }
}
