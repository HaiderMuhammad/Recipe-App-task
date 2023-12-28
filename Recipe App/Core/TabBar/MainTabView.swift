//
//  MainTabView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 26/12/2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                }
        }
        .tint(.blue)
    }
}

#Preview {
    MainTabView()
}
