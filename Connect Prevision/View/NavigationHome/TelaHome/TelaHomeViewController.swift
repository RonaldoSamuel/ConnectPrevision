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
import MaterialComponents.MaterialBottomAppBar

class TelaHomeViewController: UITabBarController{
    
    var presentationView = TelaHomeView()
    var coordinator: NavigationBarCoordinator?
    var viewModel = TelaHomeViewModel()
    var disposable = DisposeBag()
    
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bindViewModel()
        bindView()
    }
    
    func bindView(){
        
        let date = Date() // save date, so all components use the same date
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)

        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        presentationView.dateLabel.text = "Qua, Mar 24 " + "\(hour):" + "\(minute)"
        presentationView.botaoDeslogar.rx
            .tap
            .bind { self.viewModel.deslogarUsuario()
            }.disposed(by: disposable)
        
        viewModel.isUsuarioDeslogar.bind{ value in
            if value == true {
                self.navigationController?.popViewController(animated: true)
            }}.disposed(by: disposable)
        
    }
    
}
