//
//  NavigationBarCoordinator.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit

class NavigationBarCoordinator: Coordinator{
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
        let vc = HomeNavigationTabViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
