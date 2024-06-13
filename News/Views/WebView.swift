//
//  WebView.swift
//  news
//
//  Created by Stefka Krachunova on 13.06.24.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: String?
    
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = url {
            if let newUrl = URL(string: safeUrl) {
                let request = URLRequest(url: newUrl)
                uiView.load(request)
            }
        }
    }
}
