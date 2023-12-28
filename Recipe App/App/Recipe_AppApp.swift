//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Haider Muhammed on 28/12/2023.
//

import SwiftUI
import SwiftData


@main
struct Recipe_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [RecipeModel.self, Category.self])
    }
}
