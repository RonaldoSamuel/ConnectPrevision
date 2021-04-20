//
//  TelaLoginViewModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation
import Firebase
import RxSwift
import RxCocoa

class TelaLoginViewModel {
    
    var loginModel: LoginModel = LoginModel()
    var firebaseHelper = LoginHelper()
    var disposable: DisposeBag = DisposeBag()
    
    var email: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var password: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var isUserLogged: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    func viewDidLoad(){
                
        isUserLogged.accept( Auth.auth().currentUser != nil ? true : false )
        
        email.asObservable()
            .subscribe(onNext: {value in
                self.loginModel.setEmail(value)
            }
            ).disposed(by: disposable)
        
        password.asObservable()
            .subscribe(onNext: {value in
                self.loginModel.setPassword(value)
            }
            ).disposed(by: disposable)
    }
    
    func logar(){
        firebaseHelper.logarFirebase(emailModel: loginModel) {
            [weak self] (value) in  self?.isUserLogged.accept(value)
        }
        
    }
    
}
