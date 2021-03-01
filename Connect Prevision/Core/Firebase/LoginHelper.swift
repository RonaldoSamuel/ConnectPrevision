//
//  LoginHelper.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase
import MaterialComponents

class LoginHelper {
    
    func logarFirebase(emailModel: FireBaseLoginSignModel){
        
        Auth.auth().signIn(withEmail: emailModel.email, password: emailModel.password, completion: { (authResult, error) in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    print("Operação não permitida")
                    break
                case .userDisabled:
                    print("Usuario Desabilitado")
                    break
                case .wrongPassword:
                    self.snackbar(message: "Senha Incorreta")
                    break
                case .invalidEmail:
                    self.snackbar(message: "E-mail Invalido")
                    break
                default:
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                
                print("User signs in successfully")
                let email: String = Auth.auth().currentUser?.email ?? "Nulo"
                self.snackbar(message: "Usuario Logado \(email)")
            }
            
        })
        
    }
    
    func snackbar(message: String){
        let action = MDCSnackbarMessage()
        action.text = message
        
        MDCSnackbarManager.default.show(action)
    }
    
}
