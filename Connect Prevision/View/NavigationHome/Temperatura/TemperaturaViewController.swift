//
//  TemperaturaViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class TemperaturaViewController: UIViewController{
    
    var presentationView = TemperaturaView()
    var coordinator: NavigationBarCoordinator?
    var viewModel = TelaHomeViewModel()
    var disposable: DisposeBag = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentationView.contentTableView.refreshControl?.addTarget(self, action: #selector(reloadItens(_:)), for: .valueChanged)
        bindView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentationView.layoutSubviews()
        navigationController?.isNavigationBarHidden = true
        setNeedsStatusBarAppearanceUpdate()
        self.viewModel.locationManager.startUpdatingHeading()
        if viewModel.isRaining.value {
            self.presentationView.setupThemeRainUI(remover: false)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view.layer.removeAllAnimations()
        self.viewModel.locationManager.stopUpdatingHeading()
        self.presentationView.setupThemeRainUI(remover: true)
    }
    
    func bindView(){
        
        viewModel.statusFeedback.bind { value in
            print(value)
            
            switch value{
            case .VALORES_CARREGADOS:
                self.presentationView.contentTableView.reloadData()
                break
            case .CARREGANDO:
                break
            case .FALHA:
                break
            case .DEFAULT:
                break
            }
            
        }.disposed(by: disposable)
        
        viewModel.statusFeedback.bind { value in
            self.tratarFeedback(status: value)
        }.disposed(by: disposable)
        
        viewModel.grausRotacao.bind {
            value in
            let angle = -(value * .pi/180.0)
            self.presentationView.viewBussula.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        }.disposed(by: disposable)
        
        viewModel.breachesRX.bind(to: presentationView.contentTableView.rx.items(cellIdentifier: SeteDiasCell.identifier, cellType: SeteDiasCell.self)
        ) { index, item, cell in
            cell.configCell(item,index: index)
            cell.selectionStyle = .none
            cell.btnProximo.tag = index
        }.disposed(by: disposable)
    }
    
    @objc func reloadItens(_ sender: UIRefreshControl) {
        sender.endRefreshing()
        fetchBreachs()
    }
    
    func fetchBreachs(){
        self.presentationView.contentTableView.reloadData()
    }
    
    func tratarFeedback(status: TelaHomeStatus) {
        switch status {
        case .VALORES_CARREGADOS:
            atualizarDadosTela()
            break
        default:
            print("Carregando")
            break
        }
    }
    
    func atualizarDadosTela(){
        guard let current = self.viewModel.dataSourse.value.current else { return }
        guard let forecast = self.viewModel.dataSourse.value.forecast else { return }
        
        let angle = ((current.windDegree) * .pi/180)
        UIView.animate(withDuration: 0.8) {
            
            print("angulo \(angle), \(current.windDegree)")
            self.presentationView.viewPonteiro.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        }
        
        if "language".translate == "us"{
            self.presentationView.componente1.setupContentText(conteudo: "\(current.gustMph)/Mph")
            self.presentationView.componente2.setupContentText(conteudo: "\(current.visMiles)/Miles")
            self.presentationView.componente3.setupContentText(conteudo: "\(current.windDir.translate)")
            self.presentationView.componente4.setupContentText(conteudo: "\(current.windMph)/Mph")
        }else{
            self.presentationView.componente1.setupContentText(conteudo: "\(current.gustKph)/Kph")
            self.presentationView.componente2.setupContentText(conteudo: "\(current.visKM)/Km")
            self.presentationView.componente3.setupContentText(conteudo: "\(current.windDir.translate)")
            self.presentationView.componente4.setupContentText(conteudo: "\(current.windKph)/Kph")
        }
        
        self.presentationView.componente5.setupContentText(conteudo: "\(forecast.forecastday[0].day.dailyChanceOfRain)%")
        
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
        self.presentationView.imagemNuvem4.image = UIImage(named: "nuvem_chuva_4")
        
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
        self.presentationView.imagemNuvem4.image = UIImage(named: "nuvem_chuva_4")
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options:[], animations: {
            self.presentationView.backgroundColor = UIColor(red: 0.05, green: 0.03, blue: 0.30, alpha: 1.00)
           }, completion:nil)
    }
    
}

extension TemperaturaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .gray
        tableView.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}
