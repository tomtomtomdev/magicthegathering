//
//  MTGViewModel.swift
//  Magic
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation
import Combine

final class MTGViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var sets: [CardSet] = []
    @Published var isLoading = false

    private var cancellables = Set<AnyCancellable>()
    private let networkService = NetworkService()

    func fetchCards() {
        isLoading = true

        Task {
            await fetchData(endpoint: .cards, type: CardResponse.self)
        }
    }

    func fetchSets() {
        isLoading = true

        Task {
            await fetchData(endpoint: .sets, type: SetResponse.self)
        }
    }

    private func fetchData<T: Decodable>(endpoint: MTGAPI, type: T.Type) async {
        let url = endpoint.url
        networkService.fetch(url: url)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] (response: T) in
                switch response {
                case let response as CardResponse:
                    self?.cards = response.cards
                case let response as SetResponse:
                    self?.sets = response.sets
                default:
                    break
                }
            })
            .store(in: &cancellables)
    }
}
