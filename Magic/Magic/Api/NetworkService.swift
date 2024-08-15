//
//  NetworkService.swift
//  Magic
//
//  Created by tommy yohanes on 15/08/24.
//

import Foundation
import Combine

final class NetworkService {
    func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
