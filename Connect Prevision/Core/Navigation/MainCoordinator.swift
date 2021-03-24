//
//  MainCoordinator.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 19/03/21.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationcontroller: UINavigationController) {
        self.navigationController = navigationcontroller
    }
    
    func start() {
        login()
    }
    
    func login(){
        let child = LoginCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func cadastro(){
        let child = CadastroCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func home(){
        let child = NavigationBarCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
}
