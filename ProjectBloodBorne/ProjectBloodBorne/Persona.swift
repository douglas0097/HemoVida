//
//  File.swift
//  ProjectSwift
//
//  Created by Turma02-11 on 30/07/24.
//

import Foundation
import MapKit

import SwiftUI

struct Personagem: Decodable, Identifiable{
    let id: String
    let nome: String
    let foto: String
    let email: String
    let sangue: String
    let idade: Int
    let peso: Double
    let altura: Double
    let sexo: String
}


struct Solicitacoes: Codable, Hashable{
    let id: Int
    let nome: String
    let foto: String
    let sangue: String
    let descr: String
}

struct Agendamentos: Codable, Hashable {
    let data: String
    let hora: String
    let local: String

}


class PessoaGlobal: ObservableObject {
    @Published var pessoas: Personagem = Personagem(id:"2", nome: "Douglas", foto: "https://www.designi.com.br/images/preview/12161378.jpg", email: "douglas@gmail.com", sangue: "B+", idade: 23, peso: 74.0, altura: 1.80, sexo: "Masculino")
    
    
    var showalert = false
}



