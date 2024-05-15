//
//  SafariView.swift
//  OMGNews
//
//  Created by Firuza on 05.03.2024.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        SFSafariViewController(url: url)
   
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    
}
