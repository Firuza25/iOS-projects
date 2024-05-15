//
//  NewsTabView.swift
//  OMGNews
//
//  Created by Firuza on 05.03.2024.
//


import SwiftUI

struct NewsTabView: View {
//    @StateObject используется для создания объекта, который будет жить дольше, чем один цикл жизни представления, и будет сохранять свое состояние при обновлении пользовательского интерфейса.
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
            NavigationView {
                ArticleListView(articles: articles)
                    .overlay(overlayView)
                    .task(loadTask)
//                    .refreshable(action: refreshTask)
                    .navigationTitle("General")
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
           await articleNewsVM.loadArticles()
       }
       


}
