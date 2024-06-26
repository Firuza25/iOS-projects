//
//  BookmarkTabView.swift
//  OMGNews
//
//  Created by Firuza on 05.03.2024.
//

import SwiftUI

struct BookmarkTabView: View {
    
    @EnvironmentObject var articleBookmarkVM: ArticleBookmarkViewModel
    @State var searchText: String = ""
    
    var body: some View {
        let articles = self.articles
        
        ArticleListView(articles: articles)
            .overlay(overlayView(isEmpty: articles.isEmpty))
            #if !os(tvOS)
            .navigationTitle("Saved Articles")
            #endif
            #if os(macOS)
            .navigationSubtitle("\(articles.count) bookmarks(s)")
            #endif
            #if os(watchOS)
            .conditionalSearchable(showSearchbar: !articles.isEmpty, searchText: $searchText)
            #else
            .searchable(text: $searchText)
            #endif
    }
    
    private var articles: [Article] {
        return articleBookmarkVM.bookmarks
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool) -> some View {
        if isEmpty {
            EmptyPlaceholderView(text: "No saved articles", image: Image(systemName: "bookmark"))
        }
    }
}

#if os(watchOS)
fileprivate extension View {
    @ViewBuilder
    func conditionalSearchable(showSearchbar: Bool, searchText: Binding<String>) -> some View {
        if showSearchbar {
            searchable(text: searchText)
        } else {
            self
        }
    }
}
#endif

struct BookmarkTabView_Previews: PreviewProvider {
    
    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared

    static var previews: some View {
        BookmarkTabView()
            .environmentObject(articleBookmarkVM)
    }
}
