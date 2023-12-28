//
//  SearchView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI
import Combine
import SwiftData


struct SearchView: View {
    @State private var searchText: String = ""
    @State private var filterText: String = ""
    @State private var selectedCategory: String?
    let searchPublisher = PassthroughSubject<String, Never>()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    FilterRecipeView(category: selectedCategory, searchText: filterText) { recipes in
                        ForEach(recipes) { recipe in
                            RecipeListCell(item: recipe)
                                .padding([.leading, .top], 15)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .overlay {
                ContentUnavailableView("Search for Recipe", systemImage: "magnifyingglass")
                    .opacity(filterText.isEmpty ? 1 : 0)
            }
            .onChange(of: searchText) { oldValue, newValue in
                if newValue.isEmpty {
                    filterText = ""
                }
                searchPublisher.send(newValue)
            }
            .onReceive(searchPublisher.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)) { text in
                filterText = text
                print(text)
            }
            .background(.gray.opacity(0.15))
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
