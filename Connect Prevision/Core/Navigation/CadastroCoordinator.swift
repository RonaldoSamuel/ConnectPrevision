//
//  CadastroCoordinator.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 22/03/21.
//

import UIKit

class CadastroCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        cabNome()
    }
    
    func cabNome(){
        let vc = TelaCadastroViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
