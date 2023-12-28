//
//  Category.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import Foundation
import SwiftData

@Model
class Category {
    var id = UUID().uuidString
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
