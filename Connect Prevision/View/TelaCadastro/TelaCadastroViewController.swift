//
//  TelaCadastroViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import UIKit
import RxSwift
import RxCocoa

class TelaCadastroViewController: UIViewController {
    
    var disposable = DisposeBag()
    var presentationView = TelaCadastroView()
    var viewModel = TelaCadastroViewModel()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        viewModel.viewDidLoad()
        
    }
    
    func bindView(){
        
        
        
        presentationView.signUpButton.rx.tap.bind { self.viewModel.create()}.disposed(by: disposable)
        
        presentationView.txtNome.text.bind {value in print(value)}.disposed(by: disposable)
        
        presentationView.txtEmail.text.bind(to: viewModel.email).disposed(by: disposable)
        
        presentationView.txtPhone.text.bind {value in print(value)}.disposed(by: disposable)
        
        presentationView.txtSenha.text.bind(to: viewModel.password).disposed(by: disposable)
        
        presentationView.txtConfirmSenha.text.bind(to: viewModel.confirmPassword).disposed(by: disposable)
        
        viewModel.isPasswordEqual.bind { value in self.presentationView.signUpButton.isEnabled = value }.disposed(by: disposable)
        
        presentationView.loginButton.rx.tap.bind { self.navigationController?.popViewController(animated: true) }.disposed(by: disposable)
        
    }
    
}
