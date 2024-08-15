//
//  Card.swift
//  Magic
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation

struct Card: Decodable, Identifiable {
    let id: String
    let name: String
    let type: String
    let set: String
    let imageUrl: String
    let power: Int
    let toughness: Int
}

struct CardSet: Decodable, Identifiable {
    let id: String
    let name: String
    let releaseDate: String
}

struct CardResponse: Decodable {
    let cards: [Card]
}

struct SetResponse: Decodable {
    let sets: [CardSet]
}
