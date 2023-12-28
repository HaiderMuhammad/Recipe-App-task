//
//  FilterRecipeView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI
import SwiftData


struct FilterRecipeView<Content: View>: View {
    var content: ([RecipeModel]) -> Content
    
    @Query(animation: .snappy) private var recipes: [RecipeModel]
    init(category: String?, searchText: String, @ViewBuilder content: @escaping ([RecipeModel]) -> Content) {
        
        // custom Predicate
        let predicate = #Predicate<RecipeModel> { recipe in
            return recipe.recipeName.localizedStandardContains(searchText)
                || recipe.category.localizedStandardContains(searchText)
        }
        
        _recipes = Query(filter: predicate, sort: [
            SortDescriptor(\RecipeModel.recipeName, order: .reverse)
        ], animation: .snappy)
        
        self.content = content
    }
    
    var body: some View {
        content(recipes)
    }
}
