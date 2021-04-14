//
//  PerfilComponent.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 01/04/21.
//

import UIKit
import MaterialComponents
import RxSwift
import RxCocoa

class PerfilComponent: UIView {
    
    var disposable = DisposeBag()
    
    var view: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackHorizontal: UIStackView = {
        var stk = UIStackView()
        stk.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        stk.distribution = .fillEqually
        stk.axis = .horizontal
        stk.spacing = 2
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var iconTheme: UIImageView = {
        var img = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var contentLabel: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var nextIcon: UIImageView = {
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
        
        settingDefaultsContentLabel()
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
        
        
        view.addSubview(contentLabel)
        NSLayoutConstraint.activate([
            contentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: iconTheme.trailingAnchor,constant: 15)
        ])
        
        view.addSubview(nextIcon)
        NSLayoutConstraint.activate([
            nextIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            nextIcon.heightAnchor.constraint(equalToConstant: 30),
            nextIcon.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    func settingDefaultsContentLabel(){
        contentLabel.textColor = UIColor(red: 0.33, green: 0.29, blue: 0.34, alpha: 1.00)
        contentLabel.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func setupContentText(conteudo: String){
        contentLabel.text = conteudo
    }
    
    func settingDefaltsIconTheme(){
        iconTheme.contentMode = .scaleAspectFit
        nextIcon.contentMode = .scaleAspectFit
        iconTheme.tintColor = UIColor(red: 0.23, green: 0.51, blue: 0.78, alpha: 1.00)
        nextIcon.tintColor = UIColor(red: 0.23, green: 0.51, blue: 0.78, alpha: 1.00)
    }
    
    func setIcon(named: String){
        iconTheme.image = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
        nextIcon.image = UIImage(named: .ic_arrow_right)?.withRenderingMode(.alwaysTemplate)
    }
    
}

