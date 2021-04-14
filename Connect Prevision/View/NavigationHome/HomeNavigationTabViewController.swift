//
//  HomeNavigationTabViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeNavigationTabViewController: UITabBarController {
    
    var disposable: DisposeBag = DisposeBag()
    var coordinator: NavigationBarCoordinator?
    var mainViewControllers = [UIViewController]()
    
    let blurEffect = UIBlurEffect(style: .dark)
    var blurVisualEffectView: UIVisualEffectView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        tabBar.isTranslucent = false
        
        mainViewControllers.removeAll()
        
        let homeView = TelaHomeViewController()
        homeView.coordinator = coordinator
        let homeImg = UIImage(named: .ic_home)
        let homeItem = UITabBarItem(title: "home".translate, image: homeImg, tag: 1)
        homeView.tabBarItem = homeItem
        
        let TemperaturaView = TemperaturaViewController()
        TemperaturaView.coordinator = coordinator
        let devicesImg = UIImage(named: .ic_perfil_location)
        let devicesItem = UITabBarItem(title: "seven_days".translate, image: devicesImg, tag: 1)
        TemperaturaView.tabBarItem = devicesItem
        
        let perfilView = PerfilViewController()
        perfilView.coordinator = coordinator
        let perfilImg = UIImage(named: .ic_perfil)
        let perfilItem = UITabBarItem(title: "profile".translate, image: perfilImg, tag: 1)
        perfilView.tabBarItem = perfilItem
        
        mainViewControllers.append(homeView)
        mainViewControllers.append(TemperaturaView)
        mainViewControllers.append(perfilView)
        
        viewControllers = mainViewControllers.map { UINavigationController(rootViewController: $0)}
        
        blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurVisualEffectView.frame = UIScreen.main.bounds
        
    }
}
