//
//  FireBaseLoginSignModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation

class FireBaseLoginSignModel {
    private (set)  var nome: String
    private (set)  var email: String
    private (set)  var phone: String
    private (set)  var password: String
    private (set)  var confirmPassword: String
    
    init(nome: String,email: String,phone: String, password:String, confirmPassword:String){
        self.nome = nome
        self.email = email
        self.phone = phone
        self.password = password
        self.confirmPassword = confirmPassword
    }
    
    init() {
        self.nome = ""
        self.email = ""
        self.phone = ""
        self.password = ""
        self.confirmPassword = ""
    }
    
    func setNome(_ nome: String) {
        self.nome = nome
    }
    
    func setPhone(_ phone: String) {
        self.phone = phone
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func setPassword(_ password: String) {
        self.password = password
    }
    
    func setConfirmPassword(_ confirmPassword: String) {
        self.confirmPassword = confirmPassword
    }
    
}

