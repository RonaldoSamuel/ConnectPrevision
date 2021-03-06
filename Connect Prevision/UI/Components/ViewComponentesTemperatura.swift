//
//  ViewComponentesTemperatura.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import MaterialComponents
import RxSwift
import RxCocoa

class ViewComponentesTemperatura: UIView {
    
    var disposable = DisposeBag()
    
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
        createSubViews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func bindView(){
        
    }
    
    func createSubViews(){
        bindView()
        setupView()
        settingDefaultsDescLabel()
        settingDefaultsContentLabel()
        settingDefaltsIconTheme()
    }
    
    func setupView(){
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        view.addSubview(stackHorizontal)
        NSLayoutConstraint.activate([
            stackHorizontal.topAnchor.constraint(equalTo: view.topAnchor),
            stackHorizontal.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackHorizontal.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackHorizontal.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        stackHorizontal.addArrangedSubview(iconTheme)
        NSLayoutConstraint.activate([
            iconTheme.heightAnchor.constraint(equalToConstant: 55),
            iconTheme.widthAnchor.constraint(equalToConstant: size.height*0.2)
        ])
        stackHorizontal.addArrangedSubview(stackVertical)
        
        stackVertical.addArrangedSubview(descLabel)
        stackVertical.addArrangedSubview(contentLabel)
        
    }
    
    func settingDefaultsDescLabel(){
        descLabel.textColor = .lightGray
        descLabel.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    func setDesLabelText(conteudo: String){
        descLabel.text = conteudo
    }
    
    func settingDefaultsContentLabel(){
        contentLabel.textColor = UIColor(red: 0.33, green: 0.29, blue: 0.34, alpha: 1.00)
        contentLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupContentText(conteudo: String){
        contentLabel.text = conteudo
    }
    
    func settingDefaltsIconTheme(){
        iconTheme.contentMode = .scaleAspectFit
        iconTheme.tintColor = UIColor(red: 0.75, green: 0.92, blue: 0.99, alpha: 1.00)
    }
    
    func setIcon(named: String){
        iconTheme.contentMode = .scaleAspectFit
        iconTheme.image = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
    }
    
    func setIconColor(color: UIColor) {
        iconTheme.tintColor = color
    }
}
