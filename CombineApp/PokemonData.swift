//
//  PokemonData.swift
//  CombineApp
//
//  Created by Edgar Guitian Rey on 12/1/24.
//

import Foundation

struct PokemonData: Codable {
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
}

struct Sprites: Codable {
    let front_default: String
}
