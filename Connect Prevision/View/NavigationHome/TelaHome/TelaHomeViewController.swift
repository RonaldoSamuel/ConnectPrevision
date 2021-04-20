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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bindViewModel()
        bindView()
        presentationView.collectionView.rx.setDelegate(self).disposed(by: disposable)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        presentationView.layoutSubviews()
        setNeedsStatusBarAppearanceUpdate()
        if viewModel.isRaining.value {
            self.presentationView.setupThemeRainUI(remover: false)
        }
        timer?.fire()
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
        
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(atualizaData(_:)), userInfo: nil, repeats: true)
        atualizaData(timer!)
        
        presentationView.refreshButton.rx.tap.bind{
            self.viewModel.locationManager.startUpdatingLocation()
            self.atualizarDadosTela()
        }.disposed(by: disposable)
        
        viewModel.statusFeedback.bind { value in
            self.tratarFeedback(status: value)
        }.disposed(by: disposable)
        
        viewModel.dataSourseHour.bind(to: self.presentationView.collectionView.rx.items(
            cellIdentifier: TelaHomeCollectionCell.identifier,
            cellType: TelaHomeCollectionCell.self
        )
        ) { row, data, cell in
            cell.configCell(data)
            cell.viewItem.tag = row
        }.disposed(by: disposable)
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
        guard let location = self.viewModel.dataSourse.value.location else { return }
        guard let forecast = self.viewModel.dataSourse.value.forecast else { return }
        
        if "language".translate == "us"{
            self.presentationView.tempLabel.text = "\(current.tempF)"
            self.presentationView.feelsLike.text = ("feels_like".translate)+"\(current.feelslikeF)°f"
        }else{
            self.presentationView.tempLabel.text = "\(current.tempC)"
            self.presentationView.feelsLike.text = ("feels_like".translate)+"\(current.feelslikeC)°c"
        }
        
        self.presentationView.componente3.setupContentText(conteudo: "\(current.humidity)%")
        self.presentationView.localLabel.text = "\(location.name) - \(location.region)"
        print(current.lastUpdated)
        if current.uv < 4 {
            self.presentationView.componente1.setupContentText(conteudo: "low".translate)
        }else if current.uv < 7 {
            self.presentationView.componente1.setupContentText(conteudo: "moderate".translate)
        }else if current.uv < 10 {
            self.presentationView.componente1.setupContentText(conteudo: "high".translate)
        }else{
            self.presentationView.componente1.setupContentText(conteudo: "bery_high".translate)
        }
        
        self.presentationView.componente2.setupContentText(conteudo: (forecast.forecastday[0].astro.sunrise))
        self.presentationView.componente4.setupContentText(conteudo: (forecast.forecastday[0].astro.sunset))
        
        if current.isDay == 1 {
            if forecast.forecastday[0].day.dailyWillItRain == 1 {
                self.viewModel.isRaining.accept(true)
                setupRainTheme()
            }else{
            }
        }else{
            self.viewModel.isNight.accept(true)
            if forecast.forecastday[0].day.dailyWillItRain == 1 {
                self.viewModel.isRaining.accept(true)
                setupRainTheme()
                setupNightTheme()
            }
            else{
                setupNightTheme()
                self.presentationView.setupThemeNight()
            }
        }
        
    }
    
    func setupRainTheme(){
        
        //Nuvens Cinzas
        self.presentationView.imagemNuvem1.image = UIImage(named: "nuvem_chuva_1")
        self.presentationView.imagemNuvem2.image = UIImage(named: "nuvem_chuva_2")
        self.presentationView.imagemNuvem3.image = UIImage(named: "nuvem_chuva_3")
        self.presentationView.imagemNuvem4.image = UIImage(named: "nuvem_chuva_4")
        
        self.presentationView.feelsLike.layer.borderColor = UIColor.gray.cgColor
        self.presentationView.feelsLike.layer.backgroundColor = UIColor.gray.cgColor
        self.presentationView.setupThemeRainUI(remover: false)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options:[], animations: {
            self.presentationView.backgroundColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00)
           }, completion:nil)
    }
    
    func setupNightTheme(){
        
        //Nuvens Cinzas
        self.presentationView.imagemNuvem1.image = UIImage(named: "nuvem_chuva_1")
        self.presentationView.imagemNuvem2.image = UIImage(named: "nuvem_chuva_2")
        self.presentationView.imagemNuvem3.image = UIImage(named: "nuvem_chuva_3")
        self.presentationView.imagemNuvem4.image = UIImage(named: "nuvem_chuva_4")
        
        self.presentationView.feelsLike.layer.borderColor = UIColor.gray.cgColor
        self.presentationView.feelsLike.layer.backgroundColor = UIColor.gray.cgColor
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options:[], animations: {
            self.presentationView.backgroundColor = UIColor(red: 0.05, green: 0.03, blue: 0.30, alpha: 1.00)
           }, completion:nil)
    }
    
    @objc func atualizaData(_ timer: Timer){
        
        let dateFormmater = DateFormatter()
        let loc = Locale(identifier: "language".translate)
        dateFormmater.locale = loc
        if "language".translate == "us"{
            dateFormmater.dateFormat = "EE, MMM dd HH:mm"
        }else{
            dateFormmater.dateFormat = "EEEE dd/MMM HH:mm"
        }
        let date1 = Date()
        presentationView.dateLabel.text = dateFormmater.string(from: date1)
    }
    
}

extension TelaHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/5, height: 100)
    }
    
    // item spacing = vertical spacing in horizontal flow
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (UIScreen.main.bounds.width*0.1)
    }
    
    // line spacing = horizontal spacing in horizontal flow
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (UIScreen.main.bounds.width*0.05)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: (UIScreen.main.bounds.width*0.1 / 2.0),
                            bottom: 0, right: (UIScreen.main.bounds.width*0.1 / 2.0))
    }
}
