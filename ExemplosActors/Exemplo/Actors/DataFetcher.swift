//
//  DataFetcher.swift
//  Exemplo
//
//  Created by Enzo Ferroni on 30/01/26.
//

///Os atores trabalham perfeitamente com async/await, permitindo que você lide com operações assíncronas com segurança.

actor DataFetcher {
    private var cache: [String: String] = [:]

    func fetchData(for key: String) async -> String {
        if let cachedData = cache[key] {
            return cachedData
        }

        let data = await fetchFromServer(key: key) // Simula uma função assíncrona
        cache[key] = data
        return data
    }

    private func fetchFromServer(key: String) async -> String {
        // Simula uma requisição
        await Task.sleep(2_000_000_000) // 2 segundos
        return "Data for \(key)"
    }
}
