//
//  PerfilViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import RxSwift
import RxCocoa

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
        setNeedsStatusBarAppearanceUpdate()
        viewModel.bindViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func bindView(){
        
        viewModel.userName.bind{ value in self.presentationView.nameLabel.text = value }.disposed(by: disposable)
        
        presentationView.botaoDeslogar.rx
            .tap
            .bind { self.viewModel.deslogarUsuario()
            }.disposed(by: disposable)
        
        viewModel.isUsuarioDeslogar.bind{ value in
            if value == true {
                self.coordinator?.navigationController.popViewController(animated: true)
            }}.disposed(by: disposable)
        
        viewModel.userLocale.bind{ value in
            
            if(!value.isEmpty){
                print(value)
                self.presentationView.imageView.downloaded(from: value)
            }
            self.presentationView.imageView.image = UIImage(named: "Logo")
           }.disposed(by: disposable)
        
//        viewModel.userEmail.bind{ value in self.presentationView.emailLabel.text = value }.disposed(by: disposable)
//        viewModel.userNumber.bind{ value in self.presentationView.phoneLabel.text = value}.disposed(by: disposable)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
}
