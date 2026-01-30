//
//  Counter.swift
//  Exemplo
//
//  Created by Enzo Ferroni on 30/01/26.
//

///Vamos considerar um cenário em que várias tarefas aumentam um contador compartilhado.

///Definir um ator é semelhante a definir uma classe, mas usa a palavra-chave actor:
actor Counter {
    private var value = 0

    func increment() {
        value += 1
    }

    func getValue() -> Int {
        value
    }
}

///O ator garante automaticamente a segurança do segmento sem a necessidade de bloqueios ou filas explícitas.
