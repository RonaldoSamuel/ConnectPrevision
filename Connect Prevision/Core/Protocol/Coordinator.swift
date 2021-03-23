//
//  Coordinator.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 19/03/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
