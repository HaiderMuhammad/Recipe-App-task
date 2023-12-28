//
//  AllRecipesView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 25/12/2023.
//

import SwiftUI
import SwiftData


struct HomeView: View {
    @Query(sort: \RecipeModel.id) private var recipes: [RecipeModel]
    @Query(sort: \Category.name) private var categories: [Category]
    @State private var weekSlider: [[WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    @State private var currentDate: Date = .init()
    
    @State var selectedCategory: String = "Dinner"
    @State private var addState: AddState = .addRecipe
    @State private var isSheetPresented: Bool = false
    @Namespace private var animation
    
    
    var body: some View {
        GeometryReader {_ in
            NavigationStack {
                
                DateFormatView(currentDate: $currentDate)
                
                TabView(selection: $currentWeekIndex) {
                    ForEach(weekSlider.indices, id: \.self) { index in
                        let week = weekSlider[index]
                        WeekView(week: week, currentDate: $currentDate)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 90)
                .onAppear {
                    if weekSlider.isEmpty {
                        let currentWeek = Date().fetchWeek()
                        weekSlider.append(currentWeek )
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(categories) { category in
                            CategoryView(category: category) {
                                selectedCategory = category.name
                            }
                        }
                    }
                    .padding(.leading, 15)
                }
                .padding(.vertical, 20)
                
                
                RecipeListView(recipes: recipes, selectedCategory: $selectedCategory, currentDate: $currentDate)
                
                    .overlay {
                        if recipes.isEmpty {
                            ContentUnavailableView("Add your first recipe", systemImage: "cart.fill")
                        }
                    }
                    .background(.gray.opacity(0.15))
                    .padding(.top, 20)
                    .toolbar {
                        Menu {
                            Button {
                                addState = .addRecipe
                                isSheetPresented = true
                            } label: {
                                Text("Add Recipe")
                            }
                            
                            Button {
                                addState = .addCategory
                                isSheetPresented = true
                            } label: {
                                Text("Add Category")
                            }
                            
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        switch addState {
                        case .addRecipe:
                            AddRecipe()
                                .presentationDetents([.medium])
                        case .addCategory:
                            AddCategoryView()
                                .presentationDetents([.height(200)])
                        }
                    }
            }
        }
    }
    
    func CategoryView(category: Category, onTap: @escaping () -> Void) -> some View {
        return Text(category.name)
            .foregroundColor(selectedCategory == category.name ? .white : .black)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(selectedCategory == category.name ? .blue : .clear)
            .cornerRadius(10)
            .onTapGesture {
                onTap()
            }
            .onAppear {
                if selectedCategory.isEmpty {
                    selectedCategory = category.name
                }
            }
    }
}

