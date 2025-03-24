//
//  Character.swift
//  CrashTest
//
//  Created by Serhii Molodets on 24.03.2025.
//
import Foundation

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}

struct CharactersResponse: Decodable {
    let results: [Character]
}

final class RickAndMortyAPI {
    static let shared = RickAndMortyAPI()
    private init() {}

    func fetchCharacters() async throws -> [Character] {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(CharactersResponse.self, from: data)
        return decoded.results
    }
}
