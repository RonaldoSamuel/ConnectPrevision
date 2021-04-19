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

class TelaPerfilViewModel{
    
    
    var firebaseHelper = LoginHelper()
    var disposable = DisposeBag()
    
    var isUsuarioDeslogar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isRaining: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isNight: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    
    var userName: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var userEmail: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var userLocale: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var userPhoto: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var userNumber: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var dataSourse: BehaviorRelay<ForeCastModel> = BehaviorRelay<ForeCastModel>(value: ForeCastModel())
    
    func bindViews(){
        userName.accept((Auth.auth().currentUser!.displayName ?? "Usuario"))
        userEmail.accept(Auth.auth().currentUser!.email ?? "Email Do Usuario")
        userPhoto.accept("\(String(describing: Auth.auth().currentUser!.photoURL))")
        userNumber.accept(Auth.auth().currentUser!.phoneNumber ?? "Carregando")
        
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
