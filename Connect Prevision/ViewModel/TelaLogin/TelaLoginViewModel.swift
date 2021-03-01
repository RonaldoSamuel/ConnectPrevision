//
//  TelaLoginViewModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation
import RxSwift
import RxCocoa

class TelaLoginViewModel {
    
    var loginModel = FireBaseLoginSignModel()
    var firebaseHelper = LoginHelper()
    var disposable = DisposeBag()
    
    var email: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var password: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var isEmailPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isPasswordPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    var isFormPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    func viewDidLoad(){
        
        Observable.combineLatest(isEmailPreenchido, isPasswordPreenchido) { (email,password) in
            return email == true && password == true
        }
        .bind(to: isFormPreenchido)
        .disposed(by: disposable)
        
        email.asObservable()
            .subscribe(onNext: {value in
                self.isEmailPreenchido.accept(value.count > 1)
                self.loginModel.email = value
            }
            ).disposed(by: disposable)
        
        password.asObservable()
            .subscribe(onNext: {value in
                self.isPasswordPreenchido.accept(value.count > 1)
                self.loginModel.password = value
            }
            ).disposed(by: disposable)
        
        email.bind {value in self.loginModel.email = value}.disposed(by: disposable)
        password.bind {value in self.loginModel.password = value}.disposed(by: disposable)
    }
    
    func logar(){
        firebaseHelper.logarFirebase(emailModel: loginModel)
    }
    
}
