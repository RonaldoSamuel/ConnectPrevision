//
//  perfilView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import MaterialComponents

class PerfilView: UIView{
    
    var botaoDeslogar: MDCButton = {
        var btn = MDCButton()
        btn.setTitle("Deslogar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setBackgroundColor(.black,for: .normal)
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
        backgroundColor = .gray
        setupBotaoDeslogar()
    }
    
    func setupBotaoDeslogar(){
        addSubview(botaoDeslogar)
        NSLayoutConstraint.activate([
            botaoDeslogar.centerXAnchor.constraint(equalTo: centerXAnchor),
            botaoDeslogar.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
