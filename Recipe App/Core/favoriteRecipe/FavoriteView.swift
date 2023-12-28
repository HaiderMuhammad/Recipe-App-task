//
//  FavoriteView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI
import SwiftData


struct FavoriteView: View {
    @Query(sort: \RecipeModel.id) private var recipes: [RecipeModel]
    
    // manual filter
    private var favoriteRecipes: [RecipeModel] {
            recipes.filter { $0.isFavorite }
        }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(favoriteRecipes) { item in
                    RecipeListCell(item: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


