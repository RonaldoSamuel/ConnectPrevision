//
//  TelaHomeViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 01/03/21.
//

import UIKit
import MaterialComponents
import RxSwift
import RxCocoa

class TelaHomeViewController: UIViewController{
    
    var presentationView = TelaHomeView()
    var coordinator: HomeCoordinator?
    var viewModel = TelaHomeViewModel()
    var disposable = DisposeBag()
    
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bindViewModel()
        bindView()
    }
    
    func bindView(){
        
        presentationView.botaoDeslogar.rx.tap.bind { self.viewModel.deslogarUsuario() }.disposed(by: disposable)
        
        viewModel.isUsuarioDeslogar.bind{ value in value ? self.navigationController?.popViewController(animated: true) : nil }.disposed(by: disposable)
        
    }
    
}
