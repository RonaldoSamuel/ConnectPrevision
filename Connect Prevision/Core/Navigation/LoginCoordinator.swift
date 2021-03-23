//
//  LoginCoordinator.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 22/03/21.
//

import UIKit

class LoginCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: MainCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        login()
    }
    
    func login(){
        let vc = TelaLoginViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
