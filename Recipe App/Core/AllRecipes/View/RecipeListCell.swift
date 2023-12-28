//
//  RecipeListCell.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI

struct RecipeListCell: View {
    var item: RecipeModel
    
    var body: some View {
        HStack {
            Image(item.recipePhoto)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 3)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.recipeName)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                HStack {
                    Text(item.category)
                    
                    Text(item.cookingTime)
                    
                    Spacer()
                    
                    Text(item.AddedDate.format("E"))
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
            
            Spacer()

        }
    }
}

