//
//  InfoView.swift
//  ProfileCard
//
//  Created by Harsh Chaturvedi on 05/11/20.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12.0)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .foregroundColor(.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.black)
                    Text(text)
                        .bold()
                        .foregroundColor(.black)
                }
            )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Bitch Lasagna", imageName: "phone_fill")
            .previewLayout(.sizeThatFits)
    }
}
