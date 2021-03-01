//
//  ViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/02/21.
//

import UIKit
import RxSwift
import RxCocoa
import MaterialComponents

class TelaLoginViewController: UIViewController {

    var presentationView = TelaLoginView()
    var disposable = DisposeBag()
    var viewModel = TelaLoginViewModel()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func bindView(){
        
        viewModel.isFormPreenchido.bind {value in
            self.presentationView.loginButton.isEnabled = value
        }.disposed(by: disposable)
        
        presentationView.loginButton.rx
            .tap
            .bind {
                self.viewModel.logar()
            }.disposed(by: disposable)
        
        presentationView.txtEmail
            .text
            .bind(to: viewModel.email)
            .disposed(by: disposable)
        
        presentationView.txtPassword
            .text
            .bind(to: viewModel.password)
            .disposed(by: disposable)
        
        presentationView.signUpButton.rx
            .tap
            .bind {
                self.irParaCadastro()
            }.disposed(by: disposable)
    }
    
    
    func irParaCadastro(){
        let vc = TelaCadastroViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
 
    

}

