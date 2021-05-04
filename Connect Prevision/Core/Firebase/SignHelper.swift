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
    
    func criarConta(emailModel: FireBaseLoginSignModel, completion: @escaping((Bool, String)->Void)){
        Auth.auth().createUser(
            withEmail: emailModel.email,
            password: emailModel.password,
            
            completion: { authResult, Error in
                if let Error = Error as NSError? {
                    switch AuthErrorCode(rawValue: Error.code){
                    default:
                        completion(false, "\(Error.localizedDescription)")
                        break
                    }
                    
                } else {
                    let changeRequest = authResult?.user.createProfileChangeRequest()
                    changeRequest?.displayName = emailModel.nome
                    changeRequest?.commitChanges { (error) in
                        print(error)
                    }
                    completion(true, "sucesso")
                }
                
            })
    }
    
    
    
}
