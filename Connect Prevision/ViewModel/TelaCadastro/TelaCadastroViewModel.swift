//
//  TelaCadastroViewModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase

class TelaCadastroViewModel {
    
    var signUpModel = FireBaseLoginSignModel()
    var firebaseHelper = SignHelper()
    var disposable = DisposeBag()
    
    var nome: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var email: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var phone: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var password: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var confirmPassword: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var isPasswordEqual: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isFormPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    func viewDidLoad(){
        
        Observable.combineLatest(nome, email, phone, password, confirmPassword) { (value1,value2,value3,value4,value5) in
            return (value1 != "" && value2 != "" && value3 != "" && value4 != "" && value5 != "")}.bind(to: self.isFormPreenchido).disposed(by: disposable)
        
        email.asObservable()
            .subscribe(onNext: {value in
                self.signUpModel.email = value
            }
            ).disposed(by: disposable)
        
        password.asObservable()
            .subscribe(onNext: {value in
                self.signUpModel.password = value
            }
            ).disposed(by: disposable)
        
        Observable.combineLatest(password, confirmPassword) { (value1,value2) in return value1 == value2 && value1 != "" }.bind(to: self.isPasswordEqual).disposed(by: disposable)
    }
    
    func create(){
        firebaseHelper.criarConta(emailModel: signUpModel)
    }
    
}
