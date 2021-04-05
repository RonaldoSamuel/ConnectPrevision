//
//  perfilView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import MaterialComponents

class PerfilView: UIView{
    
    var topView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var iconImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "Logo")?.withRenderingMode(.alwaysOriginal )
        img.layer.cornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var nameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Loading..."
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var changeProfileButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Change Profile", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        btn.setTitleColor(.blue, for: .normal)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var yourCountView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var yourCountLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Sua Conta"
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    var stackVerticalComponents: UIStackView = {
        var stk = UIStackView()
        stk.distribution = .fillEqually
        stk.spacing = 2
        stk.axis = .vertical
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var componenteYourCount1: PerfilComponent = {
        var comp = PerfilComponent()
        comp.setIcon(named: .ic_sino)
        comp.setupContentText(conteudo: "Seus Lembretes")
        return comp
    }()
    
    var componenteYourCount2: PerfilComponent = {
        var comp = PerfilComponent()
        comp.setIcon(named: .ic_form)
        comp.setupContentText(conteudo: "Seus Pedidos")
        return comp
    }()
    
    var componenteYourCount3: PerfilComponent = {
        var comp = PerfilComponent()
        comp.setIcon(named: .ic_cartao)
        comp.setupContentText(conteudo: "Seus Cartões")
        return comp
    }()
    
    var componenteYourCount4: PerfilComponent = {
        var comp = PerfilComponent()
        comp.setIcon(named: .ic_mapa)
        comp.setupContentText(conteudo: "Seus endereços")
        return comp
    }()
    
    var componenteYourCount5: PerfilComponent = {
        var comp = PerfilComponent()
        comp.setIcon(named: .ic_lock)
        comp.setupContentText(conteudo: "Alterar Senha")
        return comp
    }()
    
    var botaoDeslogar: MDCButton = {
        var btn = MDCButton()
        btn.setImage(UIImage(named: "exit"), for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.setBackgroundColor(.clear,for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
        
    }
    
    func createSubViews(){
        backgroundColor = .white
        setupBotaoDeslogar()
        
        setupviewTopo()
        setupViewYourCount()
        setupStackVerticalComponentes()
    }
    
    func setupviewTopo(){
        addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        topView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 20),
            iconImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor,constant: 10),
            iconImage.widthAnchor.constraint(equalToConstant: 50),
            iconImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        topView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor,constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,constant: 15)
        ])
        
        topView.addSubview(changeProfileButton)
        NSLayoutConstraint.activate([
            changeProfileButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor,constant: 20),
            changeProfileButton.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,constant: 15)
        ])
    }
    
    func setupViewYourCount(){
        addSubview(yourCountView)
        NSLayoutConstraint.activate([
            yourCountView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            yourCountView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yourCountView.trailingAnchor.constraint(equalTo: trailingAnchor),
            yourCountView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        yourCountView.addSubview(yourCountLabel)
        NSLayoutConstraint.activate([
            yourCountLabel.centerYAnchor.constraint(equalTo: yourCountView.centerYAnchor),
            yourCountLabel.leadingAnchor.constraint(equalTo: yourCountView.leadingAnchor,constant: 30)
        ])
       
        
    }
    
    func setupStackVerticalComponentes (){
        addSubview(stackVerticalComponents)
        NSLayoutConstraint.activate([
            stackVerticalComponents.topAnchor.constraint(equalTo: yourCountView.bottomAnchor,constant: 2),
            stackVerticalComponents.leadingAnchor.constraint(equalTo: yourCountView.leadingAnchor),
            stackVerticalComponents.trailingAnchor.constraint(equalTo: yourCountView.trailingAnchor),
            stackVerticalComponents.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -size.height*0.4)
        ])
        
        stackVerticalComponents.addArrangedSubview(componenteYourCount1)
        stackVerticalComponents.addArrangedSubview(componenteYourCount2)
        stackVerticalComponents.addArrangedSubview(componenteYourCount3)
        stackVerticalComponents.addArrangedSubview(componenteYourCount4)
        stackVerticalComponents.addArrangedSubview(componenteYourCount5)
    }
    
    func setupBotaoDeslogar(){
        topView.addSubview(botaoDeslogar)
        NSLayoutConstraint.activate([
            botaoDeslogar.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -20),
            botaoDeslogar.bottomAnchor.constraint(equalTo: topView.bottomAnchor,constant: -20),
        ])
    }
    
}
