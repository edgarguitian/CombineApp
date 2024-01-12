//
//  ContentView.swift
//  CombineApp
//
//  Created by Edgar Guitian Rey on 12/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        VStack {
            if let pokemon = viewModel.pokemon {
                AsyncImage(url: URL(string: pokemon.sprites.front_default)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    default:
                        ProgressView()
                        
                    }
                }
                .frame(width: 200, height: 200)
                Text("Nombre: \(pokemon.name)")
                Text("Altura: \(pokemon.height)")
                Text("Peso: \(pokemon.weight)")
            } else {
                Text("Cargando datos...")
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


