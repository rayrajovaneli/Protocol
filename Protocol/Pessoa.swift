//
//  Pessoa.swift
//  Protocol
//
//  Created by user218260 on 5/11/22.
//

import Foundation

enum Genero: String{
    case masculino = "masculino"
    case feminino = "feminino"
}

class Pessoa{
    
    var nome: String?
    var sobrenome: String?
    var idade: Int?
    var genero: Genero?
    var avatar: String?
    var customID: Int?
    
    init(nome: String?, sobrenome: String?, idade: Int?, genero: Genero?, avatar: String?, customID: Int?){
        self.nome = nome
        self.sobrenome = sobrenome
        self.idade = idade
        self.genero = genero
        self.avatar = avatar
        self.customID = customID
    }
    
}
