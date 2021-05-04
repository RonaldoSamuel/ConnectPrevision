//
//  TelaPerfilModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 03/05/21.
//

import Foundation

class TelaPerfilModel {
    
    private (set) var nome: String
    private (set) var email: String
    private (set) var phone: String
    private (set) var password: String = ""
    
    init(nome: String, email: String, phone: String, password: String){
        self.nome = nome
        self.email = email
        self.phone = phone
        self.password = password
    }
    
    init(){
        self.nome = ""
        self.email = ""
        self.password = ""
        self.phone = ""
    }
    
  func setNome(nome: String){
        self.nome = nome
    }
    
    func setEmail(nome: String){
        self.email = nome
    }
    
    func setPhone(nome: String){
        self.phone = nome
    }
    
    func setPassowrd(nome: String){
        self.password = nome
    }
    
    func verificarCampos(){
        
        
    }
}
