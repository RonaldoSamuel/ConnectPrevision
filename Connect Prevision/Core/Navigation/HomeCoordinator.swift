//
//  HomeCoordinator.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 22/03/21.
//

import UIKit

class HomeCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
  func start(){
        home()
    }
    
    func home(){
        let vc = TelaHomeViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
}
