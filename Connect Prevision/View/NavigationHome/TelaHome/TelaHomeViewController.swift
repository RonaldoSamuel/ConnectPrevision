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
        timer?.fire()
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
        
        viewModel.bindViewModel()
        
        presentationView.botaoDeslogar.rx
            .tap
            .bind { self.viewModel.deslogarUsuario()
            }.disposed(by: disposable)
        
        viewModel.isUsuarioDeslogar.bind{ value in
            if value == true {
                self.navigationController?.popViewController(animated: true)
            }}.disposed(by: disposable)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(atualizaData(_:)), userInfo: nil, repeats: true)
        atualizaData(timer!)
        
        viewModel.isDataLoaded.bind { value in if value{
            self.presentationView.tempLabel.text = "\(self.viewModel.data!.current.tempC)"
            self.presentationView.feelsLike.text = "Feels like \(self.viewModel.data!.current.feelslikeC)"
            self.presentationView.componente3.setupContentText(conteudo: "\(self.viewModel.data!.current.humidity)%")
            self.presentationView.localLabel.text = "\(self.viewModel.data!.location.name) - \(self.viewModel.data!.location.region)"
            if self.viewModel.data!.current.uv < 4 {
                self.presentationView.componente1.setupContentText(conteudo: "Low")
            }else if self.viewModel.data!.current.uv < 7{
                self.presentationView.componente1.setupContentText(conteudo: "Moderate")
            }else if self.viewModel.data!.current.uv < 10{
                self.presentationView.componente1.setupContentText(conteudo: "High")
            }else{
                self.presentationView.componente1.setupContentText(conteudo: "Very High")
            }
        } }.disposed(by: disposable)
    }
    
    @objc func atualizaData(_ timer: Timer){
        
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "EE, MMM dd HH:mm:ss"
        let date1 = Date()
        presentationView.dateLabel.text = dateFormmater.string(from: date1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer?.invalidate()
    }
    
}
