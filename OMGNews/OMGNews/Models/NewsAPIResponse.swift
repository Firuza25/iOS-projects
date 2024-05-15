//
//  NewsAPIResponse.swift
//  OMGNews
//
//  Created by Firuza on 02.03.2024.
//

import Foundation

struct NewsAPIResponse: Decodable{
    let status:  String
    let totalResults: Int
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
