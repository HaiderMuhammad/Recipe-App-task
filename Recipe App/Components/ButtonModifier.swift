//
//  ButtonModifier.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI

struct RecipeButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            .background(Color(.systemBlue))
            .cornerRadius(8)
    }
}

