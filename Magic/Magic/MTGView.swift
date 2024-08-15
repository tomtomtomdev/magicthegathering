//
//  MTGView.swift
//  Magic
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation
import SwiftUI

struct MTGView: View {
    @StateObject private var viewModel = MTGViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.cards) { card in
                CardView(card: card)
            }
            .navigationTitle("Magic: The Gathering ")
            .onAppear {
                viewModel.fetchCards()
            }
            .overlay(
                viewModel.isLoading ? ProgressView() : nil
            )
        }
    }
}
