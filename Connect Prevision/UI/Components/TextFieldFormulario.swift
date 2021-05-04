//
//  TextFieldFormulario.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import UIKit
import MaterialComponents
import RxSwift
import RxCocoa

class TextFieldFormulario: UIView {
    
    var disposable = DisposeBag()
    var text: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isSecureTextEntry: Bool = false
    var isEditando: Bool = false
    var isValid: Bool = true
    
    var txt: MDCOutlinedTextField = {
        var txt = MDCOutlinedTextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bindView()
        createSubViews()
        settingDefaults()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        bindView()
        createSubViews()
        settingDefaults()
    }
    
    func bindView(){
        txt.rx.text.orEmpty.changed.bind(to: text).disposed(by: disposable)
        
        text.map { value in return value.count > 0 }
            .bind(to: isPreenchido)
            .disposed(by: disposable)
        
        txt.rx.controlEvent(.editingDidBegin).bind { _ in
            self.isEditando = true
            if self.isValid {
                self.txt.leadingView?.tintColor = UIColor(red: 0.25, green: 0.57, blue: 0.87, alpha: 1.00)
                self.txt.setOutlineColor(UIColor(red: 0.25, green: 0.57, blue: 0.87, alpha: 1.00), for: .editing)
            }else{
                self.txt.setOutlineColor(.systemRed, for: .editing)
                self.txt.leadingView?.tintColor = UIColor.systemRed
            }
            
        }.disposed(by: disposable)
        
        txt.rx.controlEvent(.editingDidEnd).bind { _ in
            self.isEditando = false
            self.isValid ?
                self.isPreenchido.value ? ( self.txt.leadingView?.tintColor = UIColor(red: 0.25, green: 0.57, blue: 0.87, alpha: 1.00)) : ( self.txt.leadingView?.tintColor = .gray) :
                self.isPreenchido.value ? ( self.txt.leadingView?.tintColor = UIColor(red: 0.25, green: 0.57, blue: 0.87, alpha: 1.00)) : ( self.txt.leadingView?.tintColor = .systemRed)
        }.disposed(by: disposable)
    
        text.bind{ value in
            if !value.isEmpty{
                self.txt.setOutlineColor(.clear, for: .normal)
                self.txt.label.text = ""
                self.isValid = true
            }
        }.disposed(by: disposable)
    }
    
    func createSubViews(){
        setupTxt()
    }
    
    func setupTxt(){
        addSubview(txt)
        NSLayoutConstraint.activate([
            txt.topAnchor.constraint(equalTo: topAnchor),
            txt.leadingAnchor.constraint(equalTo: leadingAnchor),
            txt.trailingAnchor.constraint(equalTo: trailingAnchor),
            txt.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func settingDefaults(){
        txt.containerRadius = 25
        txt.layer.cornerRadius = 25
        txt.font = UIFont.boldSystemFont(ofSize: 15)
        txt.contentVerticalAlignment = .center
        txt.backgroundColor = .white
        txt.preferredContainerHeight = 60
        txt.autocapitalizationType = .none
        txt.autocorrectionType = .no
        txt.setOutlineColor(.clear, for: .normal)
        txt.setOutlineColor(UIColor(red: 0.25, green: 0.57, blue: 0.87, alpha: 1.00), for: .editing)
        txt.setTextColor(UIColor(red: 0.25, green: 0.57, blue: 0.87, alpha: 1.00), for: .normal)
        txt.setTextColor(UIColor(red: 0.25, green: 0.57, blue: 0.87, alpha: 1.00), for: .editing)
    }
    
    func togglePasswordVisible(){
        isSecureTextEntry = !isSecureTextEntry
        txt.isSecureTextEntry = isSecureTextEntry
    }
    
    func setIcon(named: String){
        let imagem = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imagem.contentMode = .scaleAspectFit
        imagem.image = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
        txt.leadingView = imagem
        txt.leadingView?.tintColor = .gray
        txt.leadingViewMode = MDCOutlinedTextField.ViewMode.always
    }
    
    
    func setPlaceholder(_ text: String){
        txt.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
    }
    
    func setupInvalidCamp(_ text: String){
        isValid = false
        txt.setNormalLabelColor(.systemRed, for: .normal)
        txt.setNormalLabelColor(.systemRed, for: .editing)
        txt.setFloatingLabelColor(.systemRed, for: .normal)
        txt.setFloatingLabelColor(.systemRed, for: .editing)
        txt.label.text = text
        txt.leadingView?.tintColor = .systemRed
        txt.setOutlineColor(.systemRed, for: .normal)
    }
    
}
