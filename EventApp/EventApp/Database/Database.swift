//
//  Database.swift
//  EventApp
//
//  Created by Firuza on 09.05.2024.
//

import SwiftUI
import FirebaseFirestore

class Database: ObservableObject {
    @Published var productList = [ProductsModel]()
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        let db = Firestore.firestore()
        
        db.collection("PRODUCTS").addSnapshotListener { snapshot, error in
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    if let category = document.get("category") as? String,
                       let title = document.get("title") as? String,
                       let description = document.get("description") as? String,
                       let images = document.get("images") as? [String],
                       let timeTimestamp = document.get("time") as? Timestamp,
                       let ageLimit = document.get("ageLimit") as? String,
                       let priceRange = document.get("priceRange") as? [Int],
                       let city = document.get("city") as? String {
                        
                        let time = timeTimestamp.dateValue()
                        
                        self.productList.append(ProductsModel(
                            id: document.documentID,
                            category: category,
                            title: title,
                            description: description,
                            images: images,
                            time: time,
                            ageLimit: ageLimit,
                            priceRange: priceRange,
                            city: city,
                            reviews: [sampleReview]
                        ))
                    }
                }
            } else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}
