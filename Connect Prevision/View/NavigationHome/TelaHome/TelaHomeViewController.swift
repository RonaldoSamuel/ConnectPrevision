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
    
    var timer: Timer?
    
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
        
//        viewModel.pegarTemperatura()
        
        presentationView.botaoDeslogar.rx
            .tap
            .bind { self.viewModel.deslogarUsuario()
            }.disposed(by: disposable)
        
        viewModel.isUsuarioDeslogar.bind{ value in
            if value == true {
                self.navigationController?.popViewController(animated: true)
            }}.disposed(by: disposable)
        
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(atualizaData(_:)), userInfo: nil, repeats: true)
        atualizaData(timer!)
    }
    
    @objc func atualizaData(_ timer: Timer){
        
        let dateFormmater = DateFormatter()
        
//        dateFormmater.dateStyle = .medium
//        dateFormmater.timeStyle = .short
        dateFormmater.dateFormat = "EE, MMM dd HH:mm"
        
        let date1 = Date()
        presentationView.dateLabel.text = dateFormmater.string(from: date1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer?.invalidate()
    }
    
}
