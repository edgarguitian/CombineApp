//
//  PokemonViewModel.swift
//  CombineApp
//
//  Created by Edgar Guitian Rey on 12/1/24.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    @Published var pokemon: PokemonData?

    private var cancellables: Set<AnyCancellable> = []

    func fetchData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/pikachu") else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PokemonData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] pokemon in
                self?.pokemon = pokemon
            })
            .store(in: &cancellables)
    }
}
