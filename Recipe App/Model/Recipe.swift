//
//  Recipe.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 25/12/2023.
//

import Foundation
import SwiftData

@Model
class RecipeModel: Identifiable {
    var id = NSUUID().uuidString
    var recipeName: String = ""
    var ingredients: [String] = []
    var instructions: String = ""
    var cookingTime: String = ""
    var recipePhoto: String = ""
    var category: String = ""
    var isFavorite: Bool = false
    var AddedDate: Date  = Date()
    
    init() {
        
    }
    
    
}

protocol RecipeFormProtocol {
    var formIsVaild: Bool { get }
}
