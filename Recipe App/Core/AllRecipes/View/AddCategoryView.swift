//
//  AddCategoryView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI
import SwiftData


struct AddCategoryView: View {
    @State private var category = ""
    @Query(sort: \Category.name) private var categories: [Category]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Category Name")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .hSpacing(.leading)
                
                TextField("dinner", text: $category)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 12)
                    .background(.secondary.opacity(0.1), in: .rect(cornerRadius: 10))
                
                Button {
                    addCategory()
                } label: {
                    Text("Add category")
                        .modifier(RecipeButtonModifier())
                    
                }
                .padding(.top, 20)

                    
            }
            .padding(15)
        }
        .onAppear {
            print(categories.count)
        }
    }
    
    private func addCategory() {
            guard !category.isEmpty else { return }

            if categories.contains(where: { $0.name == category }) {
                print("Category already exists!")
            } else {
                let newCategory = Category(name: category)
                context.insert(newCategory)
                
                category = ""
            }
        }
}

#Preview {
    AddCategoryView()
}
