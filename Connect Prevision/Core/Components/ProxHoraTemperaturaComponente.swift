//
//  ProxHoraTemperaturaComponente.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import MaterialComponents
import RxSwift
import RxCocoa

class ProxHoraTemperaturaComponente: UIView {
    
    var disposable = DisposeBag()
    var text: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var isPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isSecureTextEntry: Bool = false
    var isEditando: Bool = false
    
    var view: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackHorizontal: UIStackView = {
        var stk = UIStackView()
        stk.distribution = .fillEqually
        stk.axis = .horizontal
        stk.spacing = 2
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var stackVertical: UIStackView = {
        var stk = UIStackView()
        stk.distribution = .fillEqually
        stk.axis = .vertical
        stk.spacing = 2
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var descLabel: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var contentLabel: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        settingDefaultsDescLabel()
        settingDefaultsContentLabel()
        settingDefaltsIconTheme()
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        bindView()
        createSubViews()
        settingDefaultsDescLabel()
        settingDefaultsContentLabel()
        settingDefaltsIconTheme()
        setupView()
    }
    
    func bindView(){
        
    }
    
    func createSubViews(){
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
        
        view.addSubview(stackVertical)
        NSLayoutConstraint.activate([
            stackVertical.topAnchor.constraint(equalTo: view.topAnchor),
            stackVertical.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackVertical.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackVertical.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
           
        stackVertical.addArrangedSubview(descLabel)
        stackVertical.addArrangedSubview(iconTheme)
        NSLayoutConstraint.activate([
            iconTheme.heightAnchor.constraint(equalToConstant: 50),
            iconTheme.widthAnchor.constraint(equalToConstant: 50)
        ])
        stackVertical.addArrangedSubview(contentLabel)
        
    }
    
    func settingDefaultsDescLabel(){
        descLabel.textColor = .lightGray
        descLabel.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    func setDesLabelText(conteudo: String){
        descLabel.text = conteudo
    }
    
    func settingDefaultsContentLabel(){
        contentLabel.textColor = UIColor(red: 0.33, green: 0.29, blue: 0.34, alpha: 1.00)
        contentLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func setupContentText(conteudo: String){
        contentLabel.text = conteudo
    }
    
    func settingDefaltsIconTheme(){
        iconTheme.contentMode = .scaleAspectFit
        iconTheme.tintColor = UIColor(red: 0.23, green: 0.51, blue: 0.78, alpha: 1.00)
    }
    
    func setIcon(named: String){
        iconTheme.contentMode = .scaleAspectFit
        iconTheme.image = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
    }
    
}

