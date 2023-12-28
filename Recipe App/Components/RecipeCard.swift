//
//  RecipeCard.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 25/12/2023.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: RecipeModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Image(recipe.recipePhoto)
                    .resizable()
                    .imageScale(.large)
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .cornerRadius(15)
                    
            }
            
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(recipe.category)
                            .font(.headline)
                            .foregroundStyle(.gray)
                        
                        Text(recipe.recipeName)
                            .font(.title3)
                            .bold()
                    }
                    
                    Spacer()
                    
                    Text(recipe.cookingTime)
                        .padding(.trailing, 5)
                }
                
                Text(recipe.instructions)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                
                
            }
        }
        .padding(.horizontal, 15)
    }
}
