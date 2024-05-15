//
//  OMGNewsApp.swift
//  OMGNews
//
//  Created by Firuza on 02.03.2024.
//

import SwiftUI

@main
struct OMGNewsApp: App {
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(articleBookmarkVM)
        }
    }
}
