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
        
        presentationView.signUpButton.rx.tap.bind { self.viewModel.validarCampos()}.disposed(by: disposable)
        
        presentationView.txtNome.text.bind(to: viewModel.txtName).disposed(by: disposable)
        
        presentationView.txtEmail.text.bind(to: viewModel.txtEmail).disposed(by: disposable)
        
        presentationView.txtPhone.text.bind(to: viewModel.txtPhone).disposed(by: disposable)
        
        presentationView.txtSenha.text.bind(to: viewModel.txtPassword).disposed(by: disposable)
        
        presentationView.txtConfirmSenha.text.bind(to: viewModel.txtConfirmPass
        ).disposed(by: disposable)
        
        presentationView.btnChange.rx.tap.bind {
            let value = self.presentationView.txtSenha.isSecureTextEntry
            value ? self.presentationView.btnChange.setImage(UIImage(named: .ic_visible)?.withRenderingMode(.alwaysTemplate), for: .normal) : self.presentationView.btnChange.setImage(UIImage(named: .ic_not_visible)?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.presentationView.txtSenha.togglePasswordVisible()
            self.presentationView.txtConfirmSenha.togglePasswordVisible()
        }.disposed(by: disposable)
        
        presentationView.loginButton.rx.tap.bind { self.coordinator?.navigationController.popViewController(animated: true)}.disposed(by: disposable)
        
        viewModel.feedbackCadastro.bind { value in
            self.tratarStatus(status: value)
        }.disposed(by: disposable)
        
        
    }
    
    func tratarStatus(status: CadastroStatus){
        switch status {
        case .cadastradoSucesso:
            navigationController?.popViewController(animated: true)
            break
        case .mostrarMensagensErro:
            presentationView.setupErrosForm(erros: viewModel.errosCadastro)
            break
        case .resetarErrosFormulario:
            break
        case .mostrarMensagensErroAPI:
            break
        default:
            break
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}
