//
//  LoginModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 20/04/21.
//

import Foundation

class LoginModel{
    
    private (set) var email: String
    private (set) var senha: String
    
    init(email: String,senha: String){
        self.email = email
        self.senha = senha
    }
    
    init(){
        self.email = ""
        self.senha = ""
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func setPassword(_ password: String) {
        self.senha = password
    }
    
}
