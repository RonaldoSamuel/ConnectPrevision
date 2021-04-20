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
        
        viewModel.userName.bind{ value in self.presentationView.nameLabel.text = value }.disposed(by: disposable)
        
        presentationView.botaoDeslogar.rx
            .tap
            .bind { self.viewModel.deslogarUsuario()
            }.disposed(by: disposable)
        
        viewModel.isUsuarioDeslogar.bind{ value in
            if value == true {
                self.viewModel.snackbar(message: "thanks_for_using_our_app".translate)
                self.coordinator?.navigationController.popViewController(animated: true)
            }}.disposed(by: disposable)
        
        viewModel.userLocale.bind{ value in
            
            if(!value.isEmpty){
                print(value)
                self.presentationView.imageView.downloaded(from: value)
            }
            self.presentationView.imageView.image = UIImage(named: "Logo")
        }.disposed(by: disposable)
        
        viewModel.isRaining.bind { value in
            if value {
                self.setupRainTheme()
            }else{
            }
        }.disposed(by: disposable)
        
        viewModel.isNight.bind{ value in
            if value {
                if self.viewModel.isRaining.value {
                    self.setupNightTheme()
                }else{
                    self.setupNightTheme()
                    self.presentationView.setupThemeNight()
                }
            }else{
                
            }
        }.disposed(by: disposable)
        
    }
    
    func setupRainTheme(){
        
        //Nuvens Cinzas
        self.presentationView.imagemNuvem1.image = UIImage(named: "nuvem_chuva_1")
        self.presentationView.imagemNuvem2.image = UIImage(named: "nuvem_chuva_2")
        self.presentationView.imagemNuvem3.image = UIImage(named: "nuvem_chuva_3")
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options:[], animations: {
            self.presentationView.backgroundColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00)
           }, completion:nil)
        self.presentationView.setupThemeRainUI(remover: false)
    }
    
    func setupNightTheme(){
        
        //Nuvens Cinzas
        self.presentationView.imagemNuvem1.image = UIImage(named: "nuvem_chuva_1")
        self.presentationView.imagemNuvem2.image = UIImage(named: "nuvem_chuva_2")
        self.presentationView.imagemNuvem3.image = UIImage(named: "nuvem_chuva_3")
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options:[], animations: {
            self.presentationView.backgroundColor = UIColor(red: 0.05, green: 0.03, blue: 0.30, alpha: 1.00)
           }, completion:nil)
    }
    
}
