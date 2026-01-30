//
//  Model.swift
//  actortest
//
//  Created by Thomas Pinheiro Grandin on 30/01/26.
//

import Foundation


/*
 Aqui temos uma classe e um ator com exatamente as mesmas propriedades e métodos.
 O contador e o método aumenta() servem para alterarmos o estado dos objetos para
 observarmos como eles se comportam.
 O método reset é para reiniciar o contador, porém não foi utilizado.
 
 */

actor Ator {
    var contador: Int = 0
    init() {}
    
    func aumenta() {
        contador += 1
    }
    func reset() {
        contador = 0
    }
}


class Classe {
    var contador: Int = 0
    init() {}
    
    func aumenta() {
        contador += 1
    }
    func reset() {
        contador = 0
    }
}
