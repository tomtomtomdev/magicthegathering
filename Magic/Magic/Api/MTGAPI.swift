//
//  MTGAPI.swift
//  Magic
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation
import Combine

// Enum for API endpoints
enum MTGAPI {
    static let baseURL = "https://api.magicthegathering.io/v1"

    case cards
    case sets

    var url: URL {
        switch self {
        case .cards:
            return URL(string: "\(MTGAPI.baseURL)/cards")!
        case .sets:
            return URL(string: "\(MTGAPI.baseURL)/sets")!
        }
    }
}
