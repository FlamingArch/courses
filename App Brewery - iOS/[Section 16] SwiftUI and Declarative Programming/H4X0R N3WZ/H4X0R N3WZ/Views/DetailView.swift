//
//  DetailView.swift
//  H4X0R N3WZ
//
//  Created by Harsh Chaturvedi on 08/11/20.
//

import SwiftUI

struct DetailView: View {
    var url : String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "deeznutz.com")
    }
}

