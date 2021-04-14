//
//  SignHelper.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation
import Firebase
import MaterialComponents

class SignHelper {
    
    func criarConta(emailModel: FireBaseLoginSignModel){
        Auth.auth().createUser(withEmail: emailModel.email, password: emailModel.password, completion: {authResult, Error in if let Error = Error as NSError? {
            switch AuthErrorCode(rawValue: Error.code){
            case .operationNotAllowed:
                self.snackbar(message: Error.localizedDescription)
                break
            case .emailAlreadyInUse:
                self.snackbar(message: Error.localizedDescription)
                print("Email Ja Existe")
                break
            case .invalidEmail:
                self.snackbar(message: Error.localizedDescription)
                print("Email Invalido")
                break
            case .weakPassword:
                self.snackbar(message: Error.localizedDescription)
                print("Sua Senha é fraca")
                break
                
            default:
                self.snackbar(message: Error.localizedDescription)
                print("Error: \(Error.localizedDescription)")
            }
            
        } else {
            self.snackbar(message: "Usuario Cadastrado com Sucesso")
        }
        
        })
    }
    
    func snackbar(message: String){
        let action = MDCSnackbarMessage()
        action.text = message
        
        MDCSnackbarManager.default.show(action)
    }
    
}
