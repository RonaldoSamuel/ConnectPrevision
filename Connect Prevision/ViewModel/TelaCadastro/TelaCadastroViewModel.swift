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

enum CadastroStatus {
    case cadastradoSucesso, mostrarMensagensErro, mostrarMensagensErroAPI, resetarErrosFormulario,`default`
}

protocol TelaCadastroViewModelInput {
    var txtName: BehaviorRelay<String> { get set }
    var txtEmail: BehaviorRelay<String> { get set }
    var txtPhone: BehaviorRelay<String> { get set}
    var txtPassword: BehaviorRelay<String> { get set }
    var txtConfirmPass: BehaviorRelay<String> { get set }
}

protocol TelaCadastroViewModelOutput {
    var feedBack: [ErrorModel<CadastroErrorType>] { get }
    var feedbackCadastro: BehaviorRelay<CadastroStatus> { get set }
}

class TelaCadastroViewModel: TelaCadastroViewModelOutput, TelaCadastroViewModelInput{
    
    // MARK: - Output
    
    var feedbackCadastro: BehaviorRelay<CadastroStatus> = BehaviorRelay<CadastroStatus>(value: .default)
    var feedBack: [ErrorModel<CadastroErrorType>] = []
    
    var errosCadastro: [ErrorModel<CadastroErrorType>] {
        get {
            return model.errors
        }
    }
    
    // MARK: - Input
    
    var txtName: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var txtEmail: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var txtPhone: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var txtPassword: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var txtConfirmPass: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    //    MARK: - BaseViewModel e functions
    
    var firebaseHelper = SignHelper()
    var disposable: DisposeBag = DisposeBag()
    var model: FireBaseLoginSignModel = FireBaseLoginSignModel()
    
    
    func viewDidLoad(){
        
        txtName.asObservable()
            .subscribe(onNext: {value in
                self.model.setNome(value)
            }).disposed(by: disposable)
        
        txtEmail.asObservable()
            .subscribe(onNext: {value in
                self.model.setEmail(value)
            }
            ).disposed(by: disposable)
        
        txtPhone.asObservable()
            .subscribe(onNext: {value in
                self.model.setPhone(value)
            }).disposed(by: disposable)
        
        txtPassword.asObservable()
            .subscribe(onNext: {value in
                self.model.setPassword(value)
            }
            ).disposed(by: disposable)
        
        txtConfirmPass.asObservable()
            .subscribe(onNext: {value in
                self.model.setConfirmPassword(value)
            }).disposed(by: disposable)
        
    }
    
    func validarCampos(){
        
        model.checarCamposCadastro()
        
        if model.isDadosCadastroValidos {
            createAccount()
        }else {
            feedbackCadastro.accept(.mostrarMensagensErro)
        }
        
    }
    
    func createAccount(){
        
        firebaseHelper.criarConta(emailModel: model,completion: { feedbackFireBase, errorMessage in
            if feedbackFireBase {
                self.feedbackCadastro.accept(.cadastradoSucesso)
            }else{
                self.snackbar(message: errorMessage)
            }
        })
    }
    
}
