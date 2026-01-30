//
//  ContentView.swift
//  Exemplo
//
//  Created by Enzo Ferroni on 30/01/26.
//

import SwiftUI

struct ContentView: View {
    let counter = Counter()
    let fetcher = DataFetcher()
    
    var body: some View {
        VStack {
            //Botão para testar o ator que incrementa
            Button ("Increment") {
                Task {
                    await counter.increment()
                    print(await counter.getValue())
                }
            }
            
            //Botão que simula de um fetch
            Button ("Get Data"){
                Task {
                    let data = await fetcher.fetchData(for: "user_123")
                    print(data)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
