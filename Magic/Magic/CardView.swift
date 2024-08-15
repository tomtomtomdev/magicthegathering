//
//  CardView.swift
//  Magic
//
//  Created by tommy yohanes on 15/08/24.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(card.name)
                .font(.headline)
            Text(card.type)
                .font(.subheadline)
            Text("Set: \(card.set)")
                .font(.subheadline)
        }
    }
}
