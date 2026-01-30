//
//  ContentView.swift
//  actortest
//
//  Created by Thomas Pinheiro Grandin on 30/01/26.
//

import SwiftUI

/*
 Nessa view, temos dois objetos, uma classe e um ator. Temos também dois contadores que são mostrados na tela. Um deles é atualizado com o valor do contador do ator, e o outro com o valor do contador da classe.
 Essa tela serve para mostrar que o acesso a propriedades e métodos do ator é assincrono e por consequência mais lento.
 */

struct ContentView: View {
    @State var ator: Ator = Ator()
    @State var classe: Classe = Classe()
    @State var contadorAtor: Int = 0
    @State var contadorClasse: Int = 0
    @State var toggle: Bool = false
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.cyan)
                    .frame(height: 200)
                VStack {
                    Text("Contador classe")
                        .font(.system(size: 24))
                        .bold()
                    Text("(Instantâneo)")
                        .font(.system(size: 24))
                        .bold()
                    Text("\(contadorClasse)")
                        .font(.system(size: 32))
                }
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            }
            .onChange(of: toggle, {
                Task {
                    // Aqui nós criamos um loop que aumenta o contador da classe até 100.000. O loop executa quase instantaneamente.
                    classe.reset()
                    for _ in 0..<100000 {
                        classe.aumenta()
                        contadorClasse = classe.contador
                    }
                }
            })
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.cyan)
                    .frame(height: 200)
                VStack {
                    Text("Contador ator")
                        .font(.system(size: 24))
                        .bold()
                    Text("(Entra em uma fila, portanto demora)")
                        .font(.system(size: 24))
                        .bold()
                    Text("\(contadorAtor)")
                        .font(.system(size: 32))
                }
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            }
            .onChange(of: toggle, {
                Task {
                    // Aqui nós criamos um loop que aumenta o contador do ator até 100.000. Cada instrução é assincrona e entra em uma fila para ser executada, portanto demora.
                    await ator.reset()
                    for _ in 0..<100000 {
                        await ator.aumenta()
                        await contadorAtor = ator.contador
                    }
                }
            })
            Button(action: {
                Task {
                    await ator.reset()
                    classe.reset()
                    await contadorAtor = ator.contador
                    contadorClasse = classe.contador
                    toggle.toggle()
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150, height: 100)
                    Text("Recomeçar\ncontador")
                        .foregroundStyle(.white)
                        .font(.system(size: 24))
                }
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
