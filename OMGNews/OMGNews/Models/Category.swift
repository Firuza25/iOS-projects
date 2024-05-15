//
//  Category.swift
//  OMGNews
//
//  Created by Firuza on 05.03.2024.
//

import Foundation


enum Category: String, CaseIterable{
    case everything
    case topHeadlines
    
    var text: String{
        if self == .everything{
            return "All news"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable{
    var id: Self { self }
}
