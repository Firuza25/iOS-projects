//
//  ArticleRowView.swift
//  OMGNews
//
//  Created by Firuza on 02.03.2024.
//

import SwiftUI

struct ArticleRowView: View {
    @EnvironmentObject var articleBookmarkVM: ArticleBookmarkViewModel
    
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: article.imageURL){
                phase in
                
                switch phase{
                case.empty:
                    
                    HStack{
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case.success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    
                case.failure:
                    HStack{
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                    
                    
                    
                @unknown default:
                    fatalError()
                    
                }
            }
            .frame(minHeight: 200, maxHeight: 300)
            .background(Color.blue.opacity(0.3))
            .clipped()
            
            
            
            
            
            
            
            
            
            
            VStack(alignment: .leading, spacing: 8){
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                
                
                
                
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(2)
                
                HStack{
                    Text(article.captionsText)
                        .lineLimit(1)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    
                    Spacer()
                    
                    Button {
                        toggleBookmark(for: article)
                    } label: {
                        Image(systemName: articleBookmarkVM.isBookmarked(for: article) ? "bookmark.fill" : "bookmark")
                    }
                    .buttonStyle(.bordered)
                    
                    
                    
                    
                    Button {
                        SharingNews(url: article.articleURL)
                    }
                label: {
                    Image(systemName: "square.and.arrow.up")
                }.buttonStyle(.bordered)
                    
                }
                
            }
            .padding([.horizontal, .bottom])
            
            
        }
    }
    
//переключение боттома
    
    private func toggleBookmark(for article: Article) {
        if articleBookmarkVM.isBookmarked(for: article) {
            articleBookmarkVM.removeBookmark(for: article)
        } else {
            articleBookmarkVM.addBookmark(for: article)
        }
    }
    
    
    
}

extension View{
    
    func SharingNews(url: URL){
        let activeShare = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activeShare, animated: true)
    }
}
