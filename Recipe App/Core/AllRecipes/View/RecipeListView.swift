//
//  RecipeListView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI
import SwiftData


struct RecipeListView: View {
    var recipes: [RecipeModel]
    @Binding var selectedCategory: String
    @Binding var currentDate: Date
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List {
            ForEach(recipes) { item in
                if item.category == selectedCategory && isSameDate(item.AddedDate, currentDate) {
                    
                    NavigationLink (
                        destination: AddRecipe(editRecipe: item)) {
                            RecipeListCell(item: item)
                                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                    Button {
                                        item.isFavorite.toggle()
                                        
                                    } label: {
                                        Label("Favorite", systemImage: "heart")
                                    }
                                    .tint(.yellow)
                                }
                        }
                }
            }
            .onDelete { indexSet in
                delete(indexSet)
            }
        }
        .listStyle(.plain)
    }
    
    func delete(_ indexSet: IndexSet) {
        for index in indexSet {
            context.delete(recipes[index])
        }
    }
}

