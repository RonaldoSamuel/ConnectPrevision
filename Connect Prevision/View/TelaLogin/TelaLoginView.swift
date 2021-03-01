//
//  TelaLoginView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/02/21.
//

import UIKit
import MaterialComponents

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
        image.image = UIImage(named: "Logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var descricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Welcome back!"
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var subDescricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "Log in to your existant account of Q allure"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtEmail: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setIcon(named: "UserIcon")
        txt.setPlaceholder("E-mail")
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtPassword: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setIcon(named: "PasswordIcon")
        txt.setPlaceholder("Password")
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var forgotButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Forgot Password?", for: .normal)
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
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.gray, for: .disabled)
        btn.disabledAlpha = 0.75
        btn.setElevation(.raisedButtonPressed, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var otherloginMethodLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Or Connect Using"
        lbl.textAlignment = .center
        lbl.textColor = .gray
//        lbl.font = UIFont.
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var facebookButton: MDCButton = {
        var btn = MDCButton()
        btn.layer.shadowRadius = 5
        btn.layer.shadowOpacity = 0.2
        btn.setImage(UIImage(named: "facebookLogo")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.setImageTintColor(.white, for: .normal)
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        btn.layer.shadowColor = UIColor.blue.cgColor
        btn.layer.cornerRadius = 4
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25)
        btn.setTitle("Facebook", for: .normal)
        btn.setBackgroundColor(UIColor(red: 0.21, green: 0.36, blue: 0.56, alpha: 1.00), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var googleButton: MDCButton = {
        var btn = MDCButton()
        btn.layer.shadowRadius = 5
        btn.layer.shadowOpacity = 0.2
        btn.setImage(UIImage(named: "google")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.setImageTintColor(.white, for: .normal)
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        btn.layer.shadowColor = UIColor.blue.cgColor
        btn.layer.cornerRadius = 4
        btn.titleLabel?.textAlignment = .right
        btn.setTitle("Google", for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25)
        btn.setBackgroundColor(UIColor(red: 0.96, green: 0.26, blue: 0.22, alpha: 1.00), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var dontHaveAccountLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Don't have an account? "
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var signUpButton: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("Sign Up", for: .normal)
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
            logoView.topAnchor.constraint(equalTo: viewItensDescricao.topAnchor,constant: 60),
            logoView.leadingAnchor.constraint(equalTo: viewItensDescricao.leadingAnchor,constant: UIScreen.main.bounds.width*0.25),
            logoView.trailingAnchor.constraint(equalTo: viewItensDescricao.trailingAnchor,constant: -UIScreen.main.bounds.width*0.25),
            logoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height*0.20)
        ])
        
        viewItensDescricao.addSubview(descricaoLabel)
        NSLayoutConstraint.activate([
            descricaoLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor,constant: 5),
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
        
        viewItensFormulario.addSubview(forgotButton)
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: txtPassword.bottomAnchor,constant: 5),
            forgotButton.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 25),
            forgotButton.trailingAnchor.constraint(equalTo: txtPassword.trailingAnchor)
        ])
        
        viewItensFormulario.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: txtPassword.bottomAnchor,constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: UIScreen.main.bounds.width*0.25),
            loginButton.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -UIScreen.main.bounds.width*0.25),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        viewItensFormulario.addSubview(otherloginMethodLabel)
        NSLayoutConstraint.activate([
            otherloginMethodLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 55),
            otherloginMethodLabel.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 25),
            otherloginMethodLabel.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -25)
        ])
        
        viewItensFormulario.addSubview(facebookButton)
        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: otherloginMethodLabel.bottomAnchor,constant: 15),
            facebookButton.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 55),
            facebookButton.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -UIScreen.main.bounds.width*0.52),
            facebookButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        viewItensFormulario.addSubview(googleButton)
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: otherloginMethodLabel.bottomAnchor,constant: 15),
            googleButton.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: UIScreen.main.bounds.width*0.52),
            googleButton.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -55),
            googleButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        viewItensFormulario.addSubview(dontHaveAccountLabel)
        NSLayoutConstraint.activate([
            dontHaveAccountLabel.topAnchor.constraint(equalTo: facebookButton.bottomAnchor,constant: 60),
            dontHaveAccountLabel.leadingAnchor.constraint(equalTo: viewItensFormulario.leadingAnchor,constant: 25),
            dontHaveAccountLabel.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -UIScreen.main.bounds.width*0.40)
        ])
        
        viewItensFormulario.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: dontHaveAccountLabel.topAnchor,constant: -7),
            signUpButton.leadingAnchor.constraint(equalTo: dontHaveAccountLabel.trailingAnchor,constant: 2),
            signUpButton.trailingAnchor.constraint(equalTo: viewItensFormulario.trailingAnchor,constant: -UIScreen.main.bounds.width*0.20),
            signUpButton.bottomAnchor.constraint(equalTo: viewItensFormulario.bottomAnchor, constant: -20)
        ])
    }
    
}
