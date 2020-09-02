//
//  DetailView.swift
//  HackerNews
//
//  Created by StartupBuilder.INFO on 9/2/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI
import UIKit
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct WebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}
