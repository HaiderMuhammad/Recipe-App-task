//
//  AddRecipe.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 25/12/2023.
//

import SwiftUI
import SwiftData


struct AddRecipe: View {
    @Query(sort: \RecipeModel.id) var recipes: [RecipeModel]
    @Query(sort: \Category.name)  var categories: [Category]
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var newRecipe: RecipeModel = RecipeModel()
    @State var editRecipe: RecipeModel?
    
    var shouldShowPlaceholder: Bool {
        return newRecipe.category.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            CustomTextField(title: "Recipe Name", hint: "recipe Name", value: $newRecipe.recipeName)
            
            CustomTextField(title: "Instructions", hint: "instructions", value: $newRecipe.instructions)
            
            HStack(spacing: 20) {
                TextField("10 min", text: $newRecipe.cookingTime)
                    .modifier(RecipeTextFieldModifier())
                    .frame(maxWidth: 130)
                    .hSpacing(.leading)
                
                Picker(
                    "Select Category", selection: $newRecipe.category
                ) {
                    if shouldShowPlaceholder {
                        Text("Select Category")
                    }
                    ForEach(categories, id: \.self) { category in
                        Text(category.name).tag(category.name)
                    }
                }
                .pickerStyle(.menu)
                
            }
            
            DatePicker("Added Date", selection: $newRecipe.AddedDate, in: Date()..., displayedComponents: .date)
            
            Button {
                if let editRecipe = editRecipe {
                    updateRecipe()
                    return
                }
                addRecipe()
                
            } label: {
                Text(editRecipe != nil ? "Update Recipe" : "Add Recipe")
                    .modifier(RecipeButtonModifier())
                    .disabled(!formIsVaild)
                    .opacity(formIsVaild ? 1.0 : 0.5)
            }
            .padding(.vertical, 50)
        }
        .padding(.horizontal, 20)
        .padding(.top, 40)
        .background(.gray.opacity(0.15))
        .onAppear {
            if let editRecipe = editRecipe {
                newRecipe = editRecipe
            }
        }
    }
    
    func addRecipe() {
        guard formIsVaild else { return }
        newRecipe.recipePhoto = "img5"
        context.insert(newRecipe)
        do {
            try context.save()
            dismiss()
        } catch {
            
            print("somthing wrong")
            print("Error saving recipe: \(error.localizedDescription)")
        }
    }
    
    func updateRecipe() {
        guard formIsVaild else { return }
        dismiss()
    }
}

extension AddRecipe: RecipeFormProtocol {
    var formIsVaild: Bool {
        return !newRecipe.recipeName.isEmpty
        && !newRecipe.category.isEmpty
        && !newRecipe.instructions.isEmpty
        && !newRecipe.cookingTime.isEmpty
    }
}


#Preview {
    AddRecipe()
}
