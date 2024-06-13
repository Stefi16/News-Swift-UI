//
//  DetailView.swift
//  news
//
//  Created by Stefka Krachunova on 13.06.24.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(url: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}
