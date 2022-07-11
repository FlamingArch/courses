//
//  WebView.swift
//  H4X0R N3WZ
//
//  Created by Harsh Chaturvedi on 08/11/20.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable{
    
    let urlString : String?
    
    func makeUIView(context: Context) -> WKWebView {
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
