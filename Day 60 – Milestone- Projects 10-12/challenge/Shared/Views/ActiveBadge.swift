//
//  ActiveBadge.swift
//  challenge
//
//  Created by Harsh Chaturvedi on 01/11/21.
//

import SwiftUI

struct ActiveBadge: View {
    var body: some View {
        ZStack {
            Text("Active")
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
        }.background(RoundedRectangle(cornerRadius: 25).foregroundColor(.green))
    }
}

