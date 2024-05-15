//
//  ContentView.swift
//  OMGNews
//
//  Created by Firuza on 02.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            TopNewsTabView()
                .tabItem {
                    Label("Top News", systemImage: "newspaper")
                }
            
            
            BookmarkTabView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
        }
        //            ArticleListView(articles: Article.previewData)
        
    }
}

#Preview {
    ContentView()
}
