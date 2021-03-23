//
//  TelaHomeView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 01/03/21.
//

import UIKit
import MaterialComponents

class TelaHomeView: UIView {
    
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
        backgroundColor = .white
        setupBotaoDeslogar()
    }
    
    func setupBotaoDeslogar(){
        addSubview(botaoDeslogar)
        NSLayoutConstraint.activate([
            botaoDeslogar.centerXAnchor.constraint(equalTo: centerXAnchor),
            botaoDeslogar.centerYAnchor.constraint(equalTo: centerYAnchor),
            botaoDeslogar.widthAnchor.constraint(equalToConstant: 100),
            botaoDeslogar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
