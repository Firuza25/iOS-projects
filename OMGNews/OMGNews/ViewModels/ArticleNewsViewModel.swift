//
//  ArticleNewsViewModel.swift
//  OMGNews
//
//  Created by Firuza on 05.03.2024.
//

import SwiftUI

enum DataFetchPhase<T> {
//    Это перечисление которое представляет состояние загрузки данных.
// как я поняла T мы берем просто как пример какбудто мы работаем с нашим Article
    case empty
    case success(T)
    case failure(Error)
}



@MainActor
class ArticleNewsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Article]>.empty

        private let newsAPI = NewsAPI.shared
//    объект, который предоставляет методы для загрузки данных из внешнего источника, например, API новостей.
        
        init(articles: [Article]? = nil) {
            if let articles = articles {
                self.phase = .success(articles)
            } else {
                self.phase = .empty
            }
        }
        
        func loadArticles() async {
            if Task.isCancelled { return }
            phase = .empty
            do {
                let articles = try await newsAPI.fetch()
                print("Articles: ", articles)
                if Task.isCancelled { return }
                phase = .success(articles)
            } catch {
                if Task.isCancelled { return }
                print("loadArticle")
                print(error.localizedDescription)
                phase = .failure(error)
            }
        }
    
        func loadTopArticles() async {
            if Task.isCancelled { return }
            phase = .empty
            do {
                let articles = try await newsAPI.topfetch()
                print("Top articles: ", articles)
                if Task.isCancelled { return }
                phase = .success(articles)
            } catch {
                if Task.isCancelled { return }
                print("loadTopArticles")
                print(error.localizedDescription)
                phase = .failure(error)
            }
        }
}
