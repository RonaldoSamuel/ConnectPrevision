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
        
        presentationView.collectionView.rx.setDelegate(self).disposed(by: disposable)
    }
    
    func bindView(){
        
        viewModel.bindViewModel()
                
        
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(atualizaData(_:)), userInfo: nil, repeats: true)
        atualizaData(timer!)
        
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
            print("Status sem validação")
            break
        }
    }
    
    func atualizarDadosTela(){
        guard let current = self.viewModel.data?.current else { return }
        guard let location = self.viewModel.data?.location else { return }
        guard let forecast = self.viewModel.data?.forecast else { return }
        
        self.presentationView.tempLabel.text = "\(current.tempC)"
        self.presentationView.feelsLike.text = "Sensação de \(current.feelslikeC)"
        self.presentationView.componente3.setupContentText(conteudo: "\(current.humidity)%")
        self.presentationView.localLabel.text = "\(location.name) - \(location.region)"
        
        if current.uv < 4 {
            self.presentationView.componente1.setupContentText(conteudo: "Baixo")
        }else if current.uv < 7 {
            self.presentationView.componente1.setupContentText(conteudo: "Moderada")
        }else if current.uv < 10 {
            self.presentationView.componente1.setupContentText(conteudo: "Elevada")
        }else{
            self.presentationView.componente1.setupContentText(conteudo: "Alta")
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
