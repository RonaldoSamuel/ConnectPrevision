//
//  RainParticleComponent.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 15/04/21.
//

import UIKit
import MaterialComponents
import RxSwift
import RxCocoa

class RainParticleComponent: UIView {
    
    var disposable = DisposeBag()
    
    var view: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var iconTheme: UIImageView = {
        var img = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bindView()
        createSubViews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        bindView()
        createSubViews()
    }
    
    func bindView(){
        
    }
    
    func createSubViews(){
        setupView()
        
        settingDefaltsIconTheme()
        setupView()
    }
    
    func setupView(){
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        view.addSubview(iconTheme)
        NSLayoutConstraint.activate([
            iconTheme.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconTheme.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            iconTheme.heightAnchor.constraint(equalToConstant: 30),
            iconTheme.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    func settingDefaltsIconTheme(){
        iconTheme.contentMode = .scaleAspectFit
    }
    
    func setIcon(named: String){
        iconTheme.image = UIImage(named: named)?.withRenderingMode(.alwaysOriginal)
    }
}
