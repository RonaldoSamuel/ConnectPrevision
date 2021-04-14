//
//  TelaCadastroView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import UIKit
import MaterialComponents


class TelaCadastroView: UIView {
    
    var scroll: UIScrollView = {
        var scl = UIScrollView()
        scl.showsVerticalScrollIndicator = false
        scl.translatesAutoresizingMaskIntoConstraints = false
        return scl
    }()
    
    var stackCadastro: UIStackView = {
        var stk = UIStackView()
        stk.axis = .vertical
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var viewItensForm: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "cad_description".translate
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var subDescricaolabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "cad_sub_description".translate
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtNome: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setPlaceholder("cad_name".translate)
        txt.setIcon(named: .ic_user)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtEmail: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setPlaceholder("cad_email".translate)
        txt.setIcon(named: .ic_email)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtPhone: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setPlaceholder("cad_phone".translate)
        txt.setIcon(named: .ic_phone)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtSenha: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setPlaceholder("cad_password".translate)
        txt.setIcon(named: .ic_password)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var btnChange: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(named: .ic_visible)?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .gray
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var txtConfirmSenha: TextFieldFormulario = {
        var txt = TextFieldFormulario()
        txt.setPlaceholder("cad_confirm_pass".translate)
        txt.setIcon(named: .ic_password)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var signUpButton: MDCButton = {
        var btn = MDCButton()
        btn.setShadowColor(UIColor(red: 0.14, green: 0.29, blue: 0.64, alpha: 1.00), for: .normal)
        btn.layer.cornerRadius = 24
        btn.setBackgroundColor(UIColor(red: 0.14, green: 0.29, blue: 0.64, alpha: 1.00), for: .normal)
        btn.setTitle("cad_confirm_button".translate, for: .normal)
        btn.setElevation(.raisedButtonPressed, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var haveACount: UILabel = {
        var lbl = UILabel()
        lbl.text = "cad_already_have_account".translate
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var loginButton: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("cad_login".translate, for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitleColor(UIColor(red: 0.23, green: 0.48, blue: 0.97, alpha: 1.00), for: .normal)
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
        setGradientBackground(
            horizontal: true,
            colorTop: UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1.00),
            colorBottom: UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00)
        )
        
        setupScrollView()
        setupStackView()
        setupViewCadastroForm()
        
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
        scroll.addSubview(stackCadastro)
        NSLayoutConstraint.activate([
            stackCadastro.topAnchor.constraint(equalTo: scroll.topAnchor),
            stackCadastro.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            stackCadastro.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            stackCadastro.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            stackCadastro.widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
    
    func setupViewCadastroForm(){
        stackCadastro.addArrangedSubview(viewItensForm)
        
        viewItensForm.addSubview(descricaoLabel)
        NSLayoutConstraint.activate([
            descricaoLabel.topAnchor.constraint(equalTo: viewItensForm.topAnchor,constant: size.height*0.13),
            descricaoLabel.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor),
            descricaoLabel.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor)
        ])
        
        viewItensForm.addSubview(subDescricaolabel)
        NSLayoutConstraint.activate([
            subDescricaolabel.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor,constant: 5),
            subDescricaolabel.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor,constant: 20),
            subDescricaolabel.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -20)
        ])
        
        viewItensForm.addSubview(txtNome)
        NSLayoutConstraint.activate([
            txtNome.topAnchor.constraint(equalTo: subDescricaolabel.bottomAnchor,constant: size.height*0.05),
            txtNome.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor,constant: 25),
            txtNome.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -25),
            txtNome.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        viewItensForm.addSubview(txtEmail)
        NSLayoutConstraint.activate([
            txtEmail.topAnchor.constraint(equalTo: txtNome.bottomAnchor,constant: size.height*0.03),
            txtEmail.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor,constant: 25),
            txtEmail.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -25)
        ])
        
        viewItensForm.addSubview(txtPhone)
        NSLayoutConstraint.activate([
            txtPhone.topAnchor.constraint(equalTo: txtEmail.bottomAnchor,constant: size.height*0.03),
            txtPhone.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor,constant: 25),
            txtPhone.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -25)
        ])
        
        viewItensForm.addSubview(txtSenha)
        NSLayoutConstraint.activate([
            txtSenha.topAnchor.constraint(equalTo: txtPhone.bottomAnchor,constant: size.height*0.03),
            txtSenha.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor,constant: 25),
            txtSenha.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -25)
        ])
        
        viewItensForm.addSubview(btnChange)
        NSLayoutConstraint.activate([
            btnChange.topAnchor.constraint(equalTo: txtSenha.topAnchor),
            btnChange.bottomAnchor.constraint(equalTo: txtSenha.bottomAnchor),
            btnChange.trailingAnchor.constraint(equalTo: txtSenha.trailingAnchor,constant: -15)
        ])
        
        viewItensForm.addSubview(txtConfirmSenha)
        NSLayoutConstraint.activate([
            txtConfirmSenha.topAnchor.constraint(equalTo: txtSenha.bottomAnchor,constant: size.height*0.03),
            txtConfirmSenha.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor,constant: 25),
            txtConfirmSenha.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -25)
        ])
        
        viewItensForm.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: txtConfirmSenha.bottomAnchor,constant: size.height*0.05),
            signUpButton.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor,constant: size.width*0.25),
            signUpButton.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -size.width*0.25),
            signUpButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        viewItensForm.addSubview(haveACount)
        NSLayoutConstraint.activate([
            haveACount.topAnchor.constraint(equalTo: signUpButton.bottomAnchor,constant: size.height*0.07),
            haveACount.leadingAnchor.constraint(equalTo: viewItensForm.leadingAnchor,constant: 25),
            haveACount.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -self.size.width*0.40)
        ])
        
        viewItensForm.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: haveACount.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: haveACount.trailingAnchor,constant: 1),
            loginButton.trailingAnchor.constraint(equalTo: viewItensForm.trailingAnchor,constant: -self.size.width*0.20),
            loginButton.heightAnchor.constraint(equalToConstant: 16),
            loginButton.bottomAnchor.constraint(equalTo: viewItensForm.bottomAnchor,constant: -25)
        ])
    }
    
}
