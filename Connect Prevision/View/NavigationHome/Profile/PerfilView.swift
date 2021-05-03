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
    
    
    var fotoUsuario: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var nomeUsuario: UILabel = {
        var lbl = UILabel()
        lbl.text = "Nome Usuário"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var btn_RemoverIcone: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.setTitle("Remover Icone", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var middleView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lbl_InformacaoConta: UILabel = {
        var lbl = UILabel()
        lbl.text = "Informações da conta"
        lbl.textColor = .gray
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var info_NomeUsuario: PerfilComponent = {
        var info = PerfilComponent()
        info.setIcon(named: .ic_person)
        info.setupContentText(conteudo: "Nome de usuário")
        info.setupInfoUser(conteudo: "Ronaldo Samuel")
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    
    var info_EmailUsuario: PerfilComponent = {
        var info = PerfilComponent()
        info.setIcon(named: .ic_email)
        info.setupInfoUser(conteudo: "ronaldo.samuel2021@gmail.com")
        info.setupContentText(conteudo: "E-mail")
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    
    var info_Telefone: PerfilComponent = {
        var info = PerfilComponent()
        info.setIcon(named: .ic_phone)
        info.setupContentText(conteudo: "Telefone")
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    
    var info_MudarSenha: PerfilComponent = {
        var info = PerfilComponent()
        info.setIcon(named: .ic_lock)
        info.setupContentText(conteudo: "Mudar senha")
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
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
    
    func createSubViews(){
        backgroundColor = UIColor(red: 0.23, green: 0.45, blue: 0.96, alpha: 1.00)
        setupNuvens()
        setupviewTopo()
        setupMiddleView()
        setupBotaoDeslogar()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topView.roundCorners([.topLeft, .topRight], radius: 50)
        UIView.animate(withDuration: 1.0) {
            self.imagemNuvem1.transform = CGAffineTransform(translationX: self.size.width*0.3+100, y: -self.size.height*0.1-100)
            self.imagemNuvem2.transform = CGAffineTransform(translationX: -self.size.width*0.3-200, y: -self.size.height*0.06+200)
            self.imagemNuvem3.transform = CGAffineTransform(translationX: self.size.width*0.1+150, y: self.size.height*0.02-150)
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
    
    func setupNuvens(){
        addSubview(imagemNuvem1)
        NSLayoutConstraint.activate([
            imagemNuvem1.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.15+100),
            imagemNuvem1.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -100),
            imagemNuvem1.widthAnchor.constraint(equalToConstant: 100),
            imagemNuvem1.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addSubview(imagemNuvem2)
        NSLayoutConstraint.activate([
            imagemNuvem2.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.15-200),
            imagemNuvem2.centerXAnchor.constraint(equalTo: centerXAnchor,constant: +200),
            imagemNuvem2.widthAnchor.constraint(equalToConstant: 100),
            imagemNuvem2.heightAnchor.constraint(equalToConstant: 100)
        ])
        addSubview(imagemNuvem3)
        NSLayoutConstraint.activate([
            imagemNuvem3.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.15+150),
            imagemNuvem3.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -150),
            imagemNuvem3.widthAnchor.constraint(equalToConstant: 100),
            imagemNuvem3.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupviewTopo(){
        addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.3),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 138)
        ])
        
        topView.addSubview(fotoUsuario)
        NSLayoutConstraint.activate([
            fotoUsuario.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 20),
            fotoUsuario.topAnchor.constraint(equalTo: topView.topAnchor,constant: 20),
            fotoUsuario.widthAnchor.constraint(equalToConstant: 100),
            fotoUsuario.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    func setupMiddleView(){
        
        addSubview(middleView)
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            middleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            middleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        setupInformacaoConta()
        setupInfoAccountComponents()
    }
    
    func setupInformacaoConta(){
        middleView.addSubview(lbl_InformacaoConta)
        NSLayoutConstraint.activate([
            lbl_InformacaoConta.topAnchor.constraint(equalTo: middleView.topAnchor,constant: 20),
            lbl_InformacaoConta.leadingAnchor.constraint(equalTo: middleView.leadingAnchor,constant: 20)
        ])
    }
    
    func setupInfoAccountComponents(){
        middleView.addSubview(info_NomeUsuario)
        NSLayoutConstraint.activate([
            info_NomeUsuario.topAnchor.constraint(equalTo: lbl_InformacaoConta.bottomAnchor,constant: 10),
            info_NomeUsuario.leadingAnchor.constraint(equalTo: middleView.leadingAnchor,constant: 10),
            info_NomeUsuario.trailingAnchor.constraint(equalTo: middleView.trailingAnchor,constant: -10),
            info_NomeUsuario.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        middleView.addSubview(info_EmailUsuario)
        NSLayoutConstraint.activate([
            info_EmailUsuario.topAnchor.constraint(equalTo: info_NomeUsuario.bottomAnchor,constant: 10),
            info_EmailUsuario.leadingAnchor.constraint(equalTo: middleView.leadingAnchor,constant: 10),
            info_EmailUsuario.trailingAnchor.constraint(equalTo: middleView.trailingAnchor,constant: -10),
            info_EmailUsuario.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        middleView.addSubview(info_Telefone)
        NSLayoutConstraint.activate([
            info_Telefone.topAnchor.constraint(equalTo: info_EmailUsuario.bottomAnchor,constant: 10),
            info_Telefone.leadingAnchor.constraint(equalTo: middleView.leadingAnchor,constant: 10),
            info_Telefone.trailingAnchor.constraint(equalTo: middleView.trailingAnchor,constant: -10),
            info_Telefone.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        middleView.addSubview(info_MudarSenha)
        NSLayoutConstraint.activate([
            info_MudarSenha.topAnchor.constraint(equalTo: info_Telefone.bottomAnchor,constant: 10),
            info_MudarSenha.leadingAnchor.constraint(equalTo: middleView.leadingAnchor,constant: 10),
            info_MudarSenha.trailingAnchor.constraint(equalTo: middleView.trailingAnchor,constant: -10),
            info_MudarSenha.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
  
    func setupBotaoDeslogar(){
        topView.addSubview(botaoDeslogar)
        NSLayoutConstraint.activate([
            botaoDeslogar.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -10),
            botaoDeslogar.topAnchor.constraint(equalTo: topView.topAnchor,constant: 20),
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
