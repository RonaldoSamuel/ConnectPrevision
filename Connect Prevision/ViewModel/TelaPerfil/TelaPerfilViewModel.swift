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

class TelaPerfilViewModel{
    
    
    var firebaseHelper = LoginHelper()
    var disposable = DisposeBag()
    
    var isUsuarioDeslogar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    
    var userName: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
   
    
    func bindViews(){
        userName.accept((Auth.auth().currentUser?.displayName ?? Auth.auth().currentUser?.email) ?? "Loading...")
        
    }
    
    func deslogarUsuario(){
        firebaseHelper.deslogarFirebase()
        isUsuarioDeslogar.accept( Auth.auth().currentUser == nil ? true : false )
    }
}
