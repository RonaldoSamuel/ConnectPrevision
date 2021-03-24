//
//  TelaHomeViewModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 19/03/21.
//

import Foundation
import Firebase
import RxSwift
import RxCocoa

class TelaHomeViewModel {
    var firebaseHelper = LoginHelper()
    
    var isUsuarioDeslogar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    func bindViewModel(){
        
    }
    
    func deslogarUsuario(){
        firebaseHelper.deslogarFirebase()
        isUsuarioDeslogar.accept( Auth.auth().currentUser == nil ? true : false )
    }
    
}
