//
//  TelaPerfilViewModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 01/04/21.
//

import Foundation
import Firebase
import RxCocoa
import RxSwift
import MaterialComponents

enum loadingStatus {
    case refresh, sucess, error, `default`
}

class TelaPerfilViewModel{
    
    
    var firebaseHelper = LoginHelper()
    var disposable = DisposeBag()
    private var model: TelaPerfilModel = TelaPerfilModel()
    
    var isUsuarioDeslogar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isRaining: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isNight: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var status: BehaviorRelay<loadingStatus> = BehaviorRelay<loadingStatus>(value: .default)
    
    
    var nome: String {
        get{
            return model.nome
        }
    }
    
    var email: String {
        get{
            return model.email
        }
    }
    
    var phone: String {
        get {
            return model.phone
        }
    }
    
    func setUsuarioLogado(){
        setupVariaveis()
    }
    
    func  setupVariaveis(){
           
           
           
           
           
        model.setNome(nome: Auth.auth().currentUser?.displayName ?? "Nulo")
        model.setEmail(nome: Auth.auth().currentUser?.email ?? "Nulo")
        model.setPhone(nome: Auth.auth().currentUser?.phoneNumber ?? "nulo")
           
        model.verificarCampos()
        
           self.status.accept(.refresh)
       }
    
    func bindViews(){
        setUsuarioLogado()
        
     
        
    }
    
    func atualizarNome(_ nome: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = nome
        changeRequest?.commitChanges { (error) in
            self.status.accept(.error)
        }
        
    }
    
    func atualizarEmail(_ email: String){
        Auth.auth().currentUser?.updateEmail(
            to: email,
            completion: {e in
                self.status.accept(.error)
            })
    }
    
    
    func atualizarSenha(_ senha: String){
        Auth.auth().currentUser?.updatePassword(to: senha) { (error) in
            self.status.accept(.error)
        }
    }
    
    func deslogarUsuario(){
        firebaseHelper.deslogarFirebase()
        isUsuarioDeslogar.accept( Auth.auth().currentUser == nil ? true : false )
    }
    
    func snackbar(message: String){
        let action = MDCSnackbarMessage()
        action.text = message
        
        MDCSnackbarManager.default.show(action)
    }
}
