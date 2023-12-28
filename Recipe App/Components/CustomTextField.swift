//
//  CustomTextField.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    let hint: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            TextField(hint, text: $value)
                .modifier(RecipeTextFieldModifier())
        }
        .padding(.vertical, 10)
    }
}

