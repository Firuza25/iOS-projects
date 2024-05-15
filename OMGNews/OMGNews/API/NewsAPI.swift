//
//  NewsAPI.swift
//  OMGNews
//
//  Created by Firuza on 05.03.2024.
//

import Foundation

struct NewsAPI {
//    Статическое свойство shared, представляющее единственный экземпляр NewsAPI (Singleton).
    static let shared = NewsAPI()
    private init(){}
    
    private let apiKey = "6b7973f043b54a1d910ca32d148c9ede"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetch() async throws -> [Article] {
        try await fetchArticles(from: generateGeneralNewsURL())
    }
    func topfetch() async throws -> [Article] {
        try await fetchArticles(from: generateTopNewsURL())
    }
    
    private func fetchArticles(from url: URL) async throws -> [Article] {
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }
        
        switch response.statusCode {
            
        case (200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occured")
            }
        default:
            throw generateError(description: "A server error occured")
        }
    }
    
    private func generateError(code: Int = 1, description: String) -> Error {
           NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
       }
       
       
    private func generateGeneralNewsURL() -> URL {
           var url = "https://newsapi.org/v2/everything?"
           url += "q=apple&"
           url += "sortBy=publishedAt&"
           url += "apiKey=\(apiKey)"
           url += "&language=en"
           return URL(string: url)!
       }
    
    private func generateTopNewsURL() -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        url += "country=us&"
        url += "category=technology&"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        return URL(string: url)!
    }
    
    
    
    
    
    
    
    
}
