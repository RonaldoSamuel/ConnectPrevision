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
    
    var isDadosCadastroValidos: Bool {
        get {
            
            return errors.count == 0
        }
    }
    
    private (set) var errors:[ErrorModel<CadastroErrorType>] = [ErrorModel<CadastroErrorType>]()
    
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
    
    func checarCamposCadastro() {
        
        errors = [ErrorModel<CadastroErrorType>]()
        
        if nome.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .nomeVazio, message: "empty_name".translate))
        }
        
        if email.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .emailVazio, message: "empty_email".translate))
        }
        
        if !email.isValidEmail {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .emailInvalido, message: "email_invalid".translate))
        }
        
        if phone.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .telefoneVazio, message: "empty_phone".translate))
        }
        
        if password.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .senhaVazia, message: "empty_password".translate))
        }
        
        if password.count < 8 {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .senhaCurta, message: "short_password".translate))
        }
        
        if !password.isSenhaForte {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .senhaFraca, message: "password_weak".translate))
        }
        
        if confirmPassword.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .confirmarSenhaVazia, message: "confirmpass_empty".translate))
        }
        
        if confirmPassword != password {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .senhasDivergentes, message: "passwords_are_different".translate))
        }
    }
    
}

