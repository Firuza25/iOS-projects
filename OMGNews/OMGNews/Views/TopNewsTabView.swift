//
//  TopNewsTabView.swift
//  OMGNews
//
//  Created by Firuza on 05.03.2024.
//

import SwiftUI

struct TopNewsTabView: View {
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
            NavigationView {
                ArticleListView(articles: articles)
                    .overlay(overlayView)
                    .task(loadTask)
//                    .refreshable(action: refreshTask)
                    .navigationTitle("Top News")
            }
        }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @ViewBuilder
     private var overlayView: some View {
         
         switch articleNewsVM.phase {
         case .empty:
             ProgressView()
         default: EmptyView()
         }
     }
    
    @Sendable
       private func loadTask() async {
           await articleNewsVM.loadTopArticles()
       }
       


}

#Preview {
    TopNewsTabView()
}
