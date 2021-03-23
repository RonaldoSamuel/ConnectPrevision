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
   weak var coordinator: CadastroCoordinator?
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
        
        presentationView.txtNome.text.bind(to: viewModel.nome).disposed(by: disposable)
        
        presentationView.txtEmail.text.bind(to: viewModel.email).disposed(by: disposable)
        
        presentationView.txtPhone.text.bind(to: viewModel.phone).disposed(by: disposable)
        
        presentationView.txtSenha.text.bind(to: viewModel.password).disposed(by: disposable)
        
        presentationView.txtConfirmSenha.text.bind(to: viewModel.confirmPassword).disposed(by: disposable)
        
//        viewModel.isPasswordEqual.bind { value in self.presentationView.signUpButton.isEnabled = value }.disposed(by: disposable)
        
        presentationView.btnChange.rx.tap.bind {
            let value = self.presentationView.txtSenha.isSecureTextEntry
            value ? self.presentationView.btnChange.setImage(UIImage(named: "visible")?.withRenderingMode(.alwaysTemplate), for: .normal) : self.presentationView.btnChange.setImage(UIImage(named: "notVisible")?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.presentationView.txtSenha.togglePasswordVisible()
            self.presentationView.txtConfirmSenha.togglePasswordVisible()
        }.disposed(by: disposable)
        
        presentationView.loginButton.rx.tap.bind { self.coordinator?.navigationController.popViewController(animated: true)}.disposed(by: disposable)
        
        viewModel.isFormPreenchido.bind { value in self.presentationView.signUpButton.isEnabled = value }.disposed(by: disposable)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}
