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
        presentationView.refreshButton.rx.tap.bind{}.disposed(by: disposable)
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
        
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(atualizaData(_:)), userInfo: nil, repeats: true)
        atualizaData(timer!)
        
        viewModel.statusFeedback.bind { value in
            self.tratarFeedback(status: value)
        }.disposed(by: disposable)
    }
    
    func tratarFeedback(status: TelaHomeStatus) {
        switch status {
        case .VALORES_CARREGADOS:
            atualizarDadosTela()
            break
        default:
            print("Status sem validação")
            break
        }
    }
    
    func atualizarDadosTela(){
        guard let current = self.viewModel.data?.current else { return }
        guard let location = self.viewModel.data?.location else { return }
        guard let forecast = self.viewModel.data?.forecast else { return }
        
        self.presentationView.tempLabel.text = "\(current.tempC)"
        self.presentationView.feelsLike.text = "Feels like \(current.feelslikeC)"
        self.presentationView.componente3.setupContentText(conteudo: "\(current.humidity)%")
        self.presentationView.localLabel.text = "\(location.name) - \(location.region)"
        
        if current.uv < 4 {
            self.presentationView.componente1.setupContentText(conteudo: "Low")
        }else if current.uv < 7 {
            self.presentationView.componente1.setupContentText(conteudo: "Moderate")
        }else if current.uv < 10 {
            self.presentationView.componente1.setupContentText(conteudo: "High")
        }else{
            self.presentationView.componente1.setupContentText(conteudo: "Very High")
        }
        
        self.presentationView.componente2.setupContentText(conteudo: (forecast.forecastday[0].astro.sunrise))
        self.presentationView.componente4.setupContentText(conteudo: (forecast.forecastday[0].astro.sunset))
    }
    
    @objc func atualizaData(_ timer: Timer){
        
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "EE, MMM dd HH:mm"
        let date1 = Date()
        presentationView.dateLabel.text = dateFormmater.string(from: date1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer?.invalidate()
    }
    
}
