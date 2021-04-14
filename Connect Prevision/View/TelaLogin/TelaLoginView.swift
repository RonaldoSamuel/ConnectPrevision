//
//  TelaLoginView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/02/21.
//

import UIKit
import MaterialComponents
import GoogleSignIn
import FBSDKLoginKit

class TelaLoginView: UIView {
    
    var scroll: UIScrollView = {
        var scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    var stackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var viewItensDescricao: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var viewItensFormulario: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logoView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: .ic_logo)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var descricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Connect Prevision"
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var subDescricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "login_using_exist_account".translate
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtEmail: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setIcon(named: .ic_user)
        txt.setPlaceholder("email".translate)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtPassword: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setIcon(named: .ic_password)
        txt.setPlaceholder("password".translate)
        txt.togglePasswordVisible()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var btnChange: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(named: .ic_not_visible)?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .gray
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var forgotButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("forgot_pass".translate, for: .normal)
        btn.setTitleColor(UIColor(red: 0.36, green: 0.39, blue: 0.42, alpha: 1.00), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        btn.backgroundColor = .clear
        btn.contentHorizontalAlignment = .right
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var loginButton: MDCButton = {
        var btn = MDCButton()
        btn.setShadowColor(UIColor(red: 0.14, green: 0.29, blue: 0.64, alpha: 1.00), for: .normal)
        btn.layer.cornerRadius = 24
        btn.setBackgroundColor(UIColor(red: 0.14, green: 0.29, blue: 0.64, alpha: 1.00), for: .normal)
        btn.setTitle("log_in".translate, for: .normal)
        btn.setTitleColor(.gray, for: .disabled)
        btn.disabledAlpha = 0.75
        btn.setElevation(.raisedButtonPressed, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var otherloginMethodLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "other_login_method".translate
        lbl.textAlignment = .center
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var facebookTeste: FBLoginButton = {
        var btn = FBLoginButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var googleTest: GIDSignInButton = {
        var btn = GIDSignInButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var dontHaveAccountLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "dont_have_account".translate
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var signUpButton: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("sign_up".translate, for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(UIColor(red: 0.23, green: 0.48, blue: 0.97, alpha: 1.00), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        createSubViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){
        backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        
        setGradientBackground(horizontal: false,
                              colorTop: UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00),
                              colorBottom: UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        )
        
        setupScrollView()
        setupStackView()
        setupViewDescricao()
        setupViewItensFormulario()
    }
    
    func setupScrollView(){
        addSubview(scroll)
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: topAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            scroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupStackView(){
        scroll.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scroll.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            stackView.widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
    
    func setupViewDescricao(){
        stackView.addArrangedSubview(viewItensDescricao)
        
        viewItensDescricao.addSubview(logoView)
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: viewItensDescricao.topAnchor,constant: 50),
            logoView.leadingAnchor.constraint(equalTo: viewItensDescricao.leadingAnchor,constant: self.size.width*0.25),
            logoView.trailingAnchor.constraint(equalTo: viewItensDescricao.trailingAnchor,constant: -self.size.width*0.25),
            logoView.heightAnchor.constraint(equalToConstant: self.size.height*0.20)
        ])
        
        viewItensDescricao.addSubview(descricaoLabel)
        NSLayoutConstraint.activate([
            descricaoLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor,constant: 15),
            descricaoLabel.leadingAnchor.constraint(equalTo: viewItensDescricao.leadingAnchor),
            descricaoLabel.trailingAnchor.constraint(equalTo: viewItensDescricao.trailingAnchor)
        ])
        
        viewItensDescricao.addSubview(subDescricaoLabel)
        NSLayoutConstraint.activate([
            subDescricaoLabel.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor,constant: 5),
            subDescricaoLabel.leadingAnchor.constraint(equalTo: viewItensDescricao.leadingAnchor),
            subDescricaoLabel.trailingAnchor.constraint(equalTo: viewItensDescricao.trailingAnchor),
            subDescricaoLabel.bottomAnchor.constraint(equalTo: viewItensDescricao.bottomAnchor)
        ])
    }
    
    func setupViewItensFormulario(){
        
        stackView.addArrangedSubview(viewItensFormulario)
        
        viewItensFormulario.addSubview(txtEmail)
        NSLayoutConstraint.activate([
            txtEmail.topAnchor.constraint(equalTo: viewItensFormulario.topAnchor,constant: 30),
            txtEmail.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 25),
            txtEmail.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -25)
        ])
        
        viewItensFormulario.addSubview(txtPassword)
        NSLayoutConstraint.activate([
            txtPassword.topAnchor.constraint(equalTo: txtEmail.bottomAnchor,constant: 20),
            txtPassword.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 25),
            txtPassword.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -25)
        ])
        
        viewItensFormulario.addSubview(btnChange)
        NSLayoutConstraint.activate([
            btnChange.topAnchor.constraint(equalTo: txtPassword.topAnchor),
            btnChange.bottomAnchor.constraint(equalTo: txtPassword.bottomAnchor),
            btnChange.trailingAnchor.constraint(equalTo: txtPassword.trailingAnchor,constant: -15)
        ])
        
        viewItensFormulario.addSubview(forgotButton)
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: txtPassword.bottomAnchor,constant: 5),
            forgotButton.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 25),
            forgotButton.trailingAnchor.constraint(equalTo: txtPassword.trailingAnchor)
        ])
        
        viewItensFormulario.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: txtPassword.bottomAnchor,constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: self.size.width*0.25),
            loginButton.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -self.size.width*0.25),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        viewItensFormulario.addSubview(otherloginMethodLabel)
        NSLayoutConstraint.activate([
            otherloginMethodLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 55),
            otherloginMethodLabel.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 25),
            otherloginMethodLabel.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -25)
        ])
        
        viewItensFormulario.addSubview(googleTest)
        NSLayoutConstraint.activate([
            googleTest.topAnchor.constraint(equalTo: otherloginMethodLabel.bottomAnchor,constant: 15),
            googleTest.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: self.size.width*0.52),
            googleTest.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -55),
            googleTest.bottomAnchor.constraint(equalTo: otherloginMethodLabel.bottomAnchor,constant: 60)
        ])
        
        viewItensFormulario.addSubview(facebookTeste)
        NSLayoutConstraint.activate([
            facebookTeste.topAnchor.constraint(equalTo: otherloginMethodLabel.bottomAnchor,constant: 19),
            facebookTeste.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 55),
            facebookTeste.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -self.size.width*0.52),
            facebookTeste.bottomAnchor.constraint(equalTo: googleTest.bottomAnchor,constant: -2)
        ])
        
        viewItensFormulario.addSubview(dontHaveAccountLabel)
        NSLayoutConstraint.activate([
            dontHaveAccountLabel.topAnchor.constraint(equalTo: facebookTeste.bottomAnchor,constant: 60),
            dontHaveAccountLabel.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 25),
            dontHaveAccountLabel.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -self.size.width*0.40)
        ])
        
        viewItensFormulario.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: dontHaveAccountLabel.topAnchor,constant: -7),
            signUpButton.leadingAnchor.constraint(equalTo: dontHaveAccountLabel.trailingAnchor,constant: 5),
            signUpButton.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -self.size.width*0.10),
            signUpButton.bottomAnchor.constraint(equalTo: viewItensFormulario.bottomAnchor, constant: -20)
        ])
    }
    
}
