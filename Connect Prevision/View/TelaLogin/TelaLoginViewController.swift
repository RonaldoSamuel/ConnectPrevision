//
//  ViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/02/21.
//

import UIKit
import RxSwift
import RxCocoa
import Firebase
import MaterialComponents
import GoogleSignIn


class TelaLoginViewController: UIViewController{

    var presentationView = TelaLoginView()
    weak var coordinator: LoginCoordinator?
    var disposable = DisposeBag()
    var viewModel = TelaLoginViewModel()
    var firebaseHelper = LoginHelper()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        viewModel.viewDidLoad()
        
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func bindView(){
        
        viewModel.isFormPreenchido.bind {value in
            self.presentationView.loginButton.isEnabled = value
        }.disposed(by: disposable)
        
        print(viewModel.isUserLogged.value)
        
        presentationView.btnChange.rx.tap.bind { _ in
            let value = self.presentationView.txtPassword.isSecureTextEntry
            value ? self.presentationView.btnChange.setImage(UIImage(named: "visible")?.withRenderingMode(.alwaysTemplate), for: .normal) : self.presentationView.btnChange.setImage(UIImage(named: "notVisible")?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.presentationView.txtPassword.togglePasswordVisible()
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
        
        viewModel.isUserLogged.bind{ value in
            if value == true {
                self.coordinator?.parentCoordinator?.home()
            }else{
                print("falso")
            }}.disposed(by: disposable)
        
        
        presentationView.signUpButton.rx
            .tap
            .bind {
                self.coordinator?.parentCoordinator?.cadastro()
            }.disposed(by: disposable)
        
       
    }
    
   
    
   
}
