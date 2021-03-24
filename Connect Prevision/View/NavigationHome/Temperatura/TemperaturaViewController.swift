//
//  TemperaturaViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit

class TemperaturaViewController: UIViewController{
    
    var presentationView = TemperaturaView()
    var coordinator: NavigationBarCoordinator?
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
}
