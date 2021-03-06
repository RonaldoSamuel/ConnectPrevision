//
//  TelaHomeView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 01/03/21.
//

import UIKit
import MaterialComponents

class TelaHomeView: UIView {
    
    var refreshButton: UIButton = {
        var btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: .ic_refresh)?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var imagemNuvem1: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: .nuvem_1)?.withRenderingMode(.alwaysTemplate)
        img.tintColor = UIColor(red: 0.73, green: 0.87, blue: 0.98, alpha: 1.00)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var imagemNuvem2: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: .nuvem_2)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var imagemNuvem3: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: .nuvem_3)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var imagemNuvem4: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: .nuvem_4)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var localLabel: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "loading".translate
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var dateLabel: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var imagemGrau: UIImageView = {
        var img = UIImageView()
        if "language".translate == "us" {
            img.image = UIImage(named: .ic_farenheit)?.withRenderingMode(.alwaysTemplate)
        }else{
            img.image = UIImage(named: .ic_celsius)?.withRenderingMode(.alwaysTemplate)
        }
        
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var tempLabel: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 68)
        lbl.text = "..."
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var feelsLike: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 20
        lbl.layer.borderWidth = 10
        lbl.layer.borderColor = UIColor(red: 0.24, green: 0.53, blue: 0.98, alpha: 1.00).cgColor
        lbl.layer.backgroundColor = UIColor(red: 0.24, green: 0.53, blue: 0.98, alpha: 1.00).cgColor
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "loading".translate
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var viewBottom: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackComponentesDadosHorizontal: UIStackView = {
        var stk = UIStackView()
        stk.distribution = .fillEqually
        stk.axis = .horizontal
        stk.spacing = 10
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var stackComponentesDadosColuna1: UIStackView = {
        var stk = UIStackView()
        stk.distribution = .fillEqually
        stk.axis = .vertical
        stk.spacing = 30
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    
    var stackComponentesDadosColuna2: UIStackView = {
        var stk = UIStackView()
        stk.distribution = .fillEqually
        stk.axis = .vertical
        stk.spacing = 30
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var componente1: ViewComponentesTemperatura = {
        var componentes = ViewComponentesTemperatura()
        componentes.setDesLabelText(conteudo: "uiv_light".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_uiv_light)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    var componente2: ViewComponentesTemperatura = {
        var componentes = ViewComponentesTemperatura()
        componentes.setDesLabelText(conteudo: "sunrise".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_sunrise)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    var componente3: ViewComponentesTemperatura = {
        var componentes = ViewComponentesTemperatura()
        componentes.setDesLabelText(conteudo: "humidity".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_humidity)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    var componente4: ViewComponentesTemperatura = {
        var componentes = ViewComponentesTemperatura()
        componentes.setDesLabelText(conteudo: "sunset".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_sunset)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    var diaTodoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "all_day".translate
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width*0.2, height: 90)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        var collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*0.2, height: 50), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.isPagingEnabled = true
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(TelaHomeCollectionCell.self, forCellWithReuseIdentifier: TelaHomeCollectionCell.identifier)
        return collection
    }()
    
    let rainParticle1: UIImageView = {
        let gif = UIImageView()
        gif.image = UIImage(named: "rainIcon")
        gif.translatesAutoresizingMaskIntoConstraints = false
        return gif
    }()
    
    let rainParticle2: UIImageView = {
        let gif = UIImageView()
        gif.image = UIImage(named: "rainIcon")
        gif.translatesAutoresizingMaskIntoConstraints = false
        return gif
    }()
    
    let rainParticle3: UIImageView = {
        let gif = UIImageView()
        gif.image = UIImage(named: "rainIcon")
        gif.translatesAutoresizingMaskIntoConstraints = false
        return gif
    }()
    
    let rainParticle4: UIImageView = {
        let gif = UIImageView()
        gif.image = UIImage(named: "rainIcon")
        gif.translatesAutoresizingMaskIntoConstraints = false
        return gif
    }()
    
    let rainParticle5: UIImageView = {
        let gif = UIImageView()
        gif.image = UIImage(named: "rainIcon")
        gif.translatesAutoresizingMaskIntoConstraints = false
        return gif
    }()
    
    let rainParticle6: UIImageView = {
        let gif = UIImageView()
        gif.image = UIImage(named: "rainIcon")
        gif.translatesAutoresizingMaskIntoConstraints = false
        return gif
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewBottom.roundCorners([.topLeft, .topRight], radius: 50)
        UIView.animate(withDuration: 1.0) {
            self.imagemNuvem1.transform = CGAffineTransform(translationX: self.size.width*0.3, y: -self.size.height*0.05)
            self.imagemNuvem2.transform = CGAffineTransform(translationX: -self.size.width*0.25, y: -self.size.height*0.06)
            self.imagemNuvem3.transform = CGAffineTransform(translationX: self.size.width*0.3, y: self.size.height*0.05)
            self.imagemNuvem4.transform = CGAffineTransform(translationX: -self.size.width*0.25, y: self.size.height*0.1)
        }
        
        UIView.animate(withDuration: 9.0, delay: 0, options: [.repeat], animations: {
            self.rainParticle1.frame = CGRect(x: 0, y: self.size.height*0.6, width: self.size.width, height: self.size.height*0.4)
        }, completion: nil)
        
        UIView.animate(withDuration: 7.0, delay: 0, options: [.repeat], animations: {
            self.rainParticle2.frame = CGRect(x: 0, y: self.size.height*0.6, width: self.size.width, height: self.size.height*0.4)
        }, completion: nil)
        
        UIView.animate(withDuration: 13.0, delay: 0, options: [.repeat], animations: {
            self.rainParticle3.frame = CGRect(x: 0, y: self.size.height*0.6, width: self.size.width, height: self.size.height*0.4)
        }, completion: nil)
        
        UIView.animate(withDuration: 4.0, delay: 0, options: [.repeat], animations: {
            self.rainParticle4.frame = CGRect(x: 0, y: self.size.height*0.6, width: self.size.width, height: self.size.height*0.4)
        }, completion: nil)
        
        UIView.animate(withDuration: 6.0, delay: 0, options: [.repeat], animations: {
            self.rainParticle5.frame = CGRect(x: 0, y: self.size.height*0.6, width: self.size.width, height: self.size.height*0.4)
        }, completion: nil)
        
        UIView.animate(withDuration: 11.0, delay: 0, options: [.repeat], animations: {
            self.rainParticle6.frame = CGRect(x: 0, y: self.size.height*0.6, width: self.size.width, height: self.size.height*0.4)
        }, completion: nil)
    }
    
    func createSubViews(){
        backgroundColor = UIColor(red: 0.23, green: 0.45, blue: 0.96, alpha: 1.00)
        setupRefreshButton()
        setupNuvem1()
        setupNuvem2()
        setupNuvem3()
        setupNuvem4()
        setupLabelLocal()
        setupLabelData()
        setupLabelTemperatura()
        setupLabelFeelsLike()
        setupViewBottom()
        setupStacks()
        setupCollectionView()
    }
    
    func setupRefreshButton(){
        addSubview(refreshButton)
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.05),
            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -size.width*0.05),
            refreshButton.widthAnchor.constraint(equalToConstant: 30),
            refreshButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    func setupNuvem1(){
        addSubview(imagemNuvem1)
        NSLayoutConstraint.activate([
            imagemNuvem1.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.1),
            imagemNuvem1.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagemNuvem1.heightAnchor.constraint(equalToConstant: 100),
            imagemNuvem1.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupNuvem2(){
        addSubview(imagemNuvem2)
        NSLayoutConstraint.activate([
            imagemNuvem2.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.1),
            imagemNuvem2.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagemNuvem2.heightAnchor.constraint(equalToConstant: 100),
            imagemNuvem2.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupNuvem3(){
        addSubview(imagemNuvem3)
        NSLayoutConstraint.activate([
            imagemNuvem3.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.1),
            imagemNuvem3.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagemNuvem3.heightAnchor.constraint(equalToConstant: 150),
            imagemNuvem3.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupNuvem4(){
        addSubview(imagemNuvem4)
        NSLayoutConstraint.activate([
            imagemNuvem4.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.1),
            imagemNuvem4.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagemNuvem4.heightAnchor.constraint(equalToConstant: 150),
            imagemNuvem4.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupLabelLocal(){
        addSubview(localLabel)
        NSLayoutConstraint.activate([
            localLabel.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.1),
            localLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupLabelData(){
        addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: localLabel.bottomAnchor,constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupLabelTemperatura(){
        addSubview(tempLabel)
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: 20),
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(imagemGrau)
        NSLayoutConstraint.activate([
            imagemGrau.topAnchor.constraint(equalTo: tempLabel.topAnchor,constant: 10),
            imagemGrau.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor,constant: 2),
            imagemGrau.heightAnchor.constraint(equalToConstant: 20),
            imagemGrau.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupLabelFeelsLike(){
        addSubview(feelsLike)
        NSLayoutConstraint.activate([
            feelsLike.topAnchor.constraint(equalTo: tempLabel.bottomAnchor,constant: 20),
            feelsLike.centerXAnchor.constraint(equalTo: centerXAnchor),
            feelsLike.heightAnchor.constraint(equalToConstant: 40),
            feelsLike.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupViewBottom(){
        addSubview(viewBottom)
        NSLayoutConstraint.activate([
            viewBottom.topAnchor.constraint(equalTo: centerYAnchor,constant: -50),
            viewBottom.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewBottom.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBottom.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    func setupStacks(){
        viewBottom.addSubview(stackComponentesDadosHorizontal)
        NSLayoutConstraint.activate([
            stackComponentesDadosHorizontal.topAnchor.constraint(equalTo: viewBottom.topAnchor,constant: 40),
            stackComponentesDadosHorizontal.leadingAnchor.constraint(equalTo: viewBottom.leadingAnchor,constant: 20),
            stackComponentesDadosHorizontal.trailingAnchor.constraint(equalTo: viewBottom.trailingAnchor,constant: -20),
        ])
        
        stackComponentesDadosHorizontal.addArrangedSubview(stackComponentesDadosColuna1)
        stackComponentesDadosColuna1.addArrangedSubview(componente1)
        stackComponentesDadosColuna1.addArrangedSubview(componente3)
        
        stackComponentesDadosHorizontal.addArrangedSubview(stackComponentesDadosColuna2)
        stackComponentesDadosColuna2.addArrangedSubview(componente2)
        stackComponentesDadosColuna2.addArrangedSubview(componente4)
    }
    
    func setupCollectionView(){
        viewBottom.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: viewBottom.bottomAnchor,constant: -120),
            collectionView.bottomAnchor.constraint(equalTo: viewBottom.bottomAnchor,constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: viewBottom.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: viewBottom.trailingAnchor)
        ])
        
        viewBottom.addSubview(diaTodoLabel)
        NSLayoutConstraint.activate([
            diaTodoLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor,constant: -20),
            diaTodoLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor)
        ])
    }
    
    func setupThemeRainUI(remover: Bool){
        if remover {
            rainParticle1.removeFromSuperview()
            rainParticle2.removeFromSuperview()
            rainParticle3.removeFromSuperview()
            rainParticle4.removeFromSuperview()
            rainParticle5.removeFromSuperview()
            rainParticle6.removeFromSuperview()
        }else{
            addSubview(rainParticle1)
            NSLayoutConstraint.activate([
                rainParticle1.topAnchor.constraint(equalTo: topAnchor,constant: -size.height*0.5),
                rainParticle1.leadingAnchor.constraint(equalTo: leadingAnchor),
                rainParticle1.trailingAnchor.constraint(equalTo: trailingAnchor),
                rainParticle1.bottomAnchor.constraint(equalTo: rainParticle1.topAnchor,constant: self.size.height*0.45)
            ])
            sendSubviewToBack(rainParticle1)
            addSubview(rainParticle2)
            NSLayoutConstraint.activate([
                rainParticle2.topAnchor.constraint(equalTo: topAnchor,constant: -size.height*0.5),
                rainParticle2.leadingAnchor.constraint(equalTo: leadingAnchor),
                rainParticle2.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 20),
                rainParticle2.bottomAnchor.constraint(equalTo: rainParticle2.topAnchor,constant: self.size.height*0.45)
            ])
            sendSubviewToBack(rainParticle2)
            addSubview(rainParticle3)
            NSLayoutConstraint.activate([
                rainParticle3.topAnchor.constraint(equalTo: topAnchor,constant: -size.height*0.5),
                rainParticle3.leadingAnchor.constraint(equalTo: leadingAnchor),
                rainParticle3.trailingAnchor.constraint(equalTo: trailingAnchor),
                rainParticle3.bottomAnchor.constraint(equalTo: rainParticle3.topAnchor,constant: self.size.height*0.45)
            ])
            sendSubviewToBack(rainParticle3)
            addSubview(rainParticle4)
            NSLayoutConstraint.activate([
                rainParticle4.topAnchor.constraint(equalTo: topAnchor,constant: -size.height*0.5),
                rainParticle4.leadingAnchor.constraint(equalTo: leadingAnchor),
                rainParticle4.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
                rainParticle4.bottomAnchor.constraint(equalTo: rainParticle4.topAnchor,constant: self.size.height*0.45)
            ])
            sendSubviewToBack(rainParticle4)
            addSubview(rainParticle5)
            NSLayoutConstraint.activate([
                rainParticle5.topAnchor.constraint(equalTo: topAnchor,constant: -size.height*0.5),
                rainParticle5.leadingAnchor.constraint(equalTo: leadingAnchor),
                rainParticle5.trailingAnchor.constraint(equalTo: trailingAnchor),
                rainParticle5.bottomAnchor.constraint(equalTo: rainParticle5.topAnchor,constant: self.size.height*0.45)
            ])
            sendSubviewToBack(rainParticle5)
            addSubview(rainParticle6)
            NSLayoutConstraint.activate([
                rainParticle6.topAnchor.constraint(equalTo: topAnchor,constant: -size.height*0.5),
                rainParticle6.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
                rainParticle6.trailingAnchor.constraint(equalTo: trailingAnchor),
                rainParticle6.bottomAnchor.constraint(equalTo: rainParticle6.topAnchor,constant: self.size.height*0.45)
            ])
            sendSubviewToBack(rainParticle6)
        }
        
    }
    
}
