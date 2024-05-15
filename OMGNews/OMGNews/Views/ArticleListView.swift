//
//  ArticleListView.swift
//  OMGNews
//
//  Created by Firuza on 03.03.2024.
//

import SwiftUI

struct ArticleListView: View {
    let articles: [Article]
    @State private var selectedNews:  Article?
    
    
    var body: some View {
        List{
            ForEach(articles){ article in
                ArticleRowView(article: article)
                    .onTapGesture {
                        selectedNews = article
                    }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .sheet(item: $selectedNews) {
            SafariView(url: $0.articleURL)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    NavigationView{
        ArticleListView(articles: Article.previewData)
    }
    
}
