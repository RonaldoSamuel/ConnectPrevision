//
//  perfilView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import MaterialComponents

class PerfilView: UIView{
    
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
        img.image = UIImage(named: .nuvem_4)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var topView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var iconImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: .ic_logo)?.withRenderingMode(.alwaysOriginal )
        img.layer.cornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var nameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "loading".translate
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 26)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var phoneLabel: UILabel = {
        var lbl = UILabel()
        
        lbl.text = "(14) 99628-2935"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lineView1: UIView = {
        var view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var cidadeLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Garça - São Paulo"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var cepLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "17400-000"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lineView2: UIView = {
        var view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var bottomView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var contaLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "your_account".translate
        lbl.textColor = .gray
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var emailLabel: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.text = "ronaldo.samuel2021@gmail.com"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var emailIcon: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: .ic_email)?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .gray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var poweredLabel: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .gray
        lbl.text = "Powered by"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var siteAPILabel: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .blue
        lbl.text = "WeatherAPI.com"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var botaoDeslogar: MDCButton = {
        var btn = MDCButton()
        btn.setImage(UIImage(named: .ic_logout)?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.setImageTintColor(.red, for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.setBackgroundColor(.clear,for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var imageView: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
        backgroundColor = UIColor(red: 0.23, green: 0.45, blue: 0.96, alpha: 1.00)
        setupNuvens()
        setupviewTopo()
        setupViewBottom()
        setupBotaoDeslogar()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topView.roundCorners([.topLeft, .topRight], radius: 25)
        
    }
    
    func setupNuvens(){
        addSubview(imagemNuvem1)
        NSLayoutConstraint.activate([
            imagemNuvem1.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.08),
            imagemNuvem1.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            imagemNuvem1.widthAnchor.constraint(equalToConstant: 100),
            imagemNuvem1.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addSubview(imagemNuvem2)
        NSLayoutConstraint.activate([
            imagemNuvem2.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.03),
            imagemNuvem2.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            imagemNuvem2.widthAnchor.constraint(equalToConstant: 100),
            imagemNuvem2.heightAnchor.constraint(equalToConstant: 100)
        ])
        addSubview(imagemNuvem3)
        NSLayoutConstraint.activate([
            imagemNuvem3.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.15),
            imagemNuvem3.leadingAnchor.constraint(equalTo: leadingAnchor,constant: size.width*0.4),
            imagemNuvem3.widthAnchor.constraint(equalToConstant: 100),
            imagemNuvem3.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupviewTopo(){
        addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.3),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
            topView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -size.height*0.25)
        ])
        
        topView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 20),
            imageView.topAnchor.constraint(equalTo: topView.topAnchor,constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        topView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor,constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 15)
        ])
        
        topView.addSubview(phoneLabel)
        NSLayoutConstraint.activate([
            phoneLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor,constant: 20),
            phoneLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 15)
        ])
        
        topView.addSubview(lineView1)
        NSLayoutConstraint.activate([
            lineView1.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 20),
            lineView1.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            lineView1.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            lineView1.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        topView.addSubview(cidadeLabel)
        NSLayoutConstraint.activate([
            cidadeLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 20),
            cidadeLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor)
        ])
        
        topView.addSubview(lineView2)
        NSLayoutConstraint.activate([
            lineView2.bottomAnchor.constraint(equalTo: topView.bottomAnchor,constant: -20),
            lineView2.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            lineView2.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            lineView2.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        topView.addSubview(cepLabel)
        NSLayoutConstraint.activate([
            cepLabel.bottomAnchor.constraint(equalTo: lineView2.topAnchor,constant: -20),
            cepLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor)
        ])
    }
    
    func setupViewBottom(){
        addSubview(bottomView)
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 0),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0)
        ])
        
        bottomView.addSubview(contaLabel)
        NSLayoutConstraint.activate([
            contaLabel.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 10),
            contaLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 40)
        ])
        
        bottomView.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor,constant: -30),
            emailLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 80)
        ])
        
        bottomView.addSubview(emailIcon)
        NSLayoutConstraint.activate([
            emailIcon.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor,constant: -30),
            emailIcon.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 50)
        ])
        
        bottomView.addSubview(poweredLabel)
        NSLayoutConstraint.activate([
            poweredLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -20),
            poweredLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor,constant: -60)
        ])
        bottomView.addSubview(siteAPILabel)
        NSLayoutConstraint.activate([
            siteAPILabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -20),
            siteAPILabel.leadingAnchor.constraint(equalTo: poweredLabel.trailingAnchor,constant: 4)
        ])
    }
    
    func setupBotaoDeslogar(){
        topView.addSubview(botaoDeslogar)
        NSLayoutConstraint.activate([
            botaoDeslogar.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -10),
            botaoDeslogar.topAnchor.constraint(equalTo: topView.topAnchor,constant: 20),
        ])
    }
    
}
