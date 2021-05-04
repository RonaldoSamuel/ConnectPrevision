//
//  PerfilViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class PerfilViewController: UIViewController{
    
    var presentationView = PerfilView()
    var coordinator: NavigationBarCoordinator?
    var viewModel = TelaPerfilViewModel()
    var disposable = DisposeBag()
    
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        viewModel.bindViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        setNeedsStatusBarAppearanceUpdate()
        presentationView.layoutSubviews()
        if viewModel.isRaining.value {
            self.presentationView.setupThemeRainUI(remover: false)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view.layer.removeAllAnimations()
        self.presentationView.setupThemeRainUI(remover: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func bindView(){
        
        presentationView.info_NomeUsuario.rx.tapGesture().when(.recognized).bind{_ in
            self.editarNomeControle() }.disposed(by: disposable)
        
        presentationView.info_EmailUsuario.rx.tapGesture().when(.recognized).bind{ _ in
            self.editarEmailControle() }.disposed(by: disposable)
        
        presentationView.info_MudarSenha.rx.tapGesture().when(.recognized).bind{ _ in
            self.editarSenhaControle() }.disposed(by: disposable)
        
        presentationView.botaoDeslogar.rx
            .tap
            .bind { self.viewModel.deslogarUsuario()
            }.disposed(by: disposable)
        
        viewModel.isUsuarioDeslogar.bind{ value in
            if value == true {
                self.viewModel.snackbar(message: "thanks_for_using_our_app".translate)
                self.coordinator?.navigationController.popViewController(animated: true)
            }}.disposed(by: disposable)
        
    
        viewModel.isRaining.bind { value in
            if value {
                self.presentationView.setupRainTheme()
            }else{
            }
        }.disposed(by: disposable)
        
        viewModel.isNight.bind{ value in
            if value {
                if self.viewModel.isRaining.value {
                    self.presentationView.setupNightTheme()
                }else{
                    self.presentationView.setupNightTheme()
                    self.presentationView.setupThemeNight()
                }
            }else{
                
            }
        }.disposed(by: disposable)
        
        viewModel.status.bind{ value in
            switch value {
            case .refresh:
                self.setupUpNames()
                break
            case .error:
                break
            case .sucess:
                break
            case .default:
                break
            }
        }.disposed(by: disposable)
    }
    
    func setupUpNames(){
        presentationView.info_NomeUsuario.setupInfoUser(conteudo: viewModel.nome)
        presentationView.info_EmailUsuario.setupInfoUser(conteudo: viewModel.email)
        presentationView.info_Telefone.setupInfoUser(conteudo: viewModel.phone)
    }
    
    func editarNomeControle(){
        let alert = UIAlertController(
            title: "edit_nome_title",
            message: "edit_nome_desc".translate,
            preferredStyle: .alert
        )
        alert.addTextField { (textField) in
            textField.placeholder = "new_name".translate
        }
        alert.addAction(UIAlertAction(title: "cancel".translate, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if let nome = alert?.textFields?[0].text {
                if !nome.isEmpty {
                    self.viewModel.atualizarNome(nome)
                    
                }
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func editarEmailControle(){
        let alert = UIAlertController(
            title: "edit_email_title",
            message: "edit_email_desc".translate,
            preferredStyle: .alert
        )
        alert.addTextField { (textField) in
            textField.placeholder = "new_email".translate
        }
        alert.addAction(UIAlertAction(title: "cancel".translate, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if let email = alert?.textFields?[0].text {
                if !email.isEmpty {
                    self.viewModel.atualizarEmail(email)
                    
                }
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func editarSenhaControle(){
        let alert = UIAlertController(
            title: "edit_password_title",
            message: "edit_password_desc".translate,
            preferredStyle: .alert
        )
        alert.addTextField { (textField) in
            textField.placeholder = "new_password".translate
        }
        alert.addAction(UIAlertAction(title: "cancel".translate, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if let senha = alert?.textFields?[0].text {
                if !senha.isEmpty {
                    self.viewModel.atualizarSenha(senha)
                    
                }
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
   
    
}
