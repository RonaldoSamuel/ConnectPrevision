//
//  TemperaturaView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit

class TemperaturaView: UIView{
    
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
    
    var topView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "seven_days".translate
        lbl.textColor = .gray
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var contentTableView: UITableView = {
        var tbl = UITableView()
        tbl.allowsMultipleSelection = false
        tbl.refreshControl = UIRefreshControl()
        tbl.register(SeteDiasCell.self, forCellReuseIdentifier: SeteDiasCell.identifier)
        tbl.separatorColor = .clear
        tbl.isUserInteractionEnabled = true
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    var windStatus: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var airQuality_lbl: UILabel = {
        var lbl = UILabel()
        lbl.text = "air_quality".translate
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var viewBussula: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 50
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var compassImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: .ic_compass)?.withRenderingMode(.alwaysOriginal)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    var viewPonteiro: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 50
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imagePonteiro: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: .ic_wind)?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
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
        componentes.setDesLabelText(conteudo: "gust_wind".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_wind)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    var componente2: ViewComponentesTemperatura = {
        var componentes = ViewComponentesTemperatura()
        componentes.setDesLabelText(conteudo: "visibility_condiction".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_visible)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    var componente3: ViewComponentesTemperatura = {
        var componentes = ViewComponentesTemperatura()
        componentes.setDesLabelText(conteudo: "wind_direction".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_wind_direction)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    var componente4: ViewComponentesTemperatura = {
        var componentes = ViewComponentesTemperatura()
        componentes.setDesLabelText(conteudo: "wind_speed".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_wind_speed)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    var componente5: ViewComponentesTemperatura = {
        var componentes = ViewComponentesTemperatura()
        componentes.setDesLabelText(conteudo: "rain_chance".translate)
        componentes.setupContentText(conteudo: "...")
        componentes.setIcon(named: .ic_rain_chance)
        componentes.translatesAutoresizingMaskIntoConstraints = false
        return componentes
    }()
    
    let rainGif: UIImageView = {
        let gif = UIImageView()
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
        topView.roundCorners([.topLeft, .topRight], radius: 50)
        windStatus.addBorders(edges: .top, color: .gray)
        UIView.animate(withDuration: 1.0) {
            self.imagemNuvem1.transform = CGAffineTransform(translationX: self.size.width*0.43, y: -self.size.height*0.06)
            self.imagemNuvem2.transform = CGAffineTransform(translationX: -self.size.width*0.43, y: self.size.height*0.005)
            self.imagemNuvem3.transform = CGAffineTransform(translationX: self.size.width*0.3, y: self.size.height*0.01)
            self.imagemNuvem4.transform = CGAffineTransform(translationX: -self.size.width*0.1, y: -self.size.height*0.07)
        }
    }
    
    func createSubViews(){
        backgroundColor =  UIColor(red: 0.23, green: 0.45, blue: 0.96, alpha: 1.00)
        setupNuvens()
        setupTopView()
        setupDescricaoLabel()
        setupTableView()
        setupWindView()
        setupWindDescription()
        setupStacks()
    }
    
    func setupNuvens(){
        setupNuvem1()
        setupNuvem2()
        setupNuvem3()
        setupNuvem4()
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
    
    func setupTopView(){
        addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.2),
            topView.bottomAnchor.constraint(equalTo: bottomAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupDescricaoLabel(){
        topView.addSubview(descricaoLabel)
        NSLayoutConstraint.activate([
            descricaoLabel.topAnchor.constraint(equalTo: topView.topAnchor,constant: 25),
            descricaoLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor,constant: -size.width*0.20)
        ])
    }
    
    func setupTableView(){
        topView.addSubview(contentTableView)
        NSLayoutConstraint.activate([
            contentTableView.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor,constant: 10),
            contentTableView.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 0),
            contentTableView.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -0),
            contentTableView.heightAnchor.constraint(equalToConstant: size.height*0.2)
        ])
    }
    
    func setupWindView(){
        topView.addSubview(windStatus)
        NSLayoutConstraint.activate([
            windStatus.topAnchor.constraint(equalTo: contentTableView.bottomAnchor,constant: 10),
            windStatus.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            windStatus.leadingAnchor.constraint(equalTo: leadingAnchor),
            windStatus.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    
    func setupWindDescription(){
        windStatus.addSubview(airQuality_lbl)
        NSLayoutConstraint.activate([
            airQuality_lbl.topAnchor.constraint(equalTo: windStatus.topAnchor,constant: 20),
            airQuality_lbl.centerXAnchor.constraint(equalTo: windStatus.centerXAnchor,constant: -size.width*0.20)
        ])
        
        windStatus.addSubview(viewBussula)
        NSLayoutConstraint.activate([
            viewBussula.trailingAnchor.constraint(equalTo: windStatus.trailingAnchor,constant: -15),
            viewBussula.bottomAnchor.constraint(equalTo: windStatus.bottomAnchor,constant: -10),
            viewBussula.widthAnchor.constraint(equalToConstant: 80),
            viewBussula.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        viewBussula.addSubview(compassImage)
        NSLayoutConstraint.activate([
            compassImage.leadingAnchor.constraint(equalTo: viewBussula.leadingAnchor),
            compassImage.trailingAnchor.constraint(equalTo: viewBussula.trailingAnchor),
            compassImage.topAnchor.constraint(equalTo: viewBussula.topAnchor),
            compassImage.bottomAnchor.constraint(equalTo: viewBussula.bottomAnchor)
        ])
        
        viewBussula.addSubview(viewPonteiro)
        NSLayoutConstraint.activate([
            viewPonteiro.leadingAnchor.constraint(equalTo: viewBussula.leadingAnchor),
            viewPonteiro.trailingAnchor.constraint(equalTo: viewBussula.trailingAnchor),
            viewPonteiro.topAnchor.constraint(equalTo: viewBussula.topAnchor),
            viewPonteiro.bottomAnchor.constraint(equalTo: viewBussula.bottomAnchor)
        ])
        
        viewPonteiro.addSubview(imagePonteiro)
        NSLayoutConstraint.activate([
            imagePonteiro.centerYAnchor.constraint(equalTo: viewPonteiro.centerYAnchor),
            imagePonteiro.leadingAnchor.constraint(equalTo: viewPonteiro.trailingAnchor,constant: -15),
            imagePonteiro.trailingAnchor.constraint(equalTo: viewPonteiro.trailingAnchor,constant: 5),
            imagePonteiro.heightAnchor.constraint(equalToConstant: 45)
        ])
        
    }
    
    func setupStacks(){
        windStatus.addSubview(stackComponentesDadosHorizontal)
        NSLayoutConstraint.activate([
            stackComponentesDadosHorizontal.topAnchor.constraint(equalTo: airQuality_lbl.bottomAnchor,constant: size.height*0.02),
            stackComponentesDadosHorizontal.leadingAnchor.constraint(equalTo: windStatus.leadingAnchor,constant: 20),
            stackComponentesDadosHorizontal.trailingAnchor.constraint(equalTo: windStatus.trailingAnchor,constant: -20),
            stackComponentesDadosHorizontal.heightAnchor.constraint(equalToConstant: size.height*0.3)
        ])
        
        stackComponentesDadosHorizontal.addArrangedSubview(stackComponentesDadosColuna1)
        stackComponentesDadosColuna1.addArrangedSubview(componente1)
        stackComponentesDadosColuna1.addArrangedSubview(componente3)
        stackComponentesDadosColuna1.addArrangedSubview(componente5)
        
        stackComponentesDadosHorizontal.addArrangedSubview(stackComponentesDadosColuna2)
        stackComponentesDadosColuna2.addArrangedSubview(componente2)
        stackComponentesDadosColuna2.addArrangedSubview(componente4)
        stackComponentesDadosColuna2.addArrangedSubview(UIView())
    }
    
    func setupThemeRainUI(remover: Bool){
        if remover {
            rainGif.removeFromSuperview()
        }else{
            addSubview(rainGif)
            NSLayoutConstraint.activate([
                rainGif.topAnchor.constraint(equalTo: topAnchor),
                rainGif.leadingAnchor.constraint(equalTo: leadingAnchor),
                rainGif.trailingAnchor.constraint(equalTo: trailingAnchor),
                rainGif.bottomAnchor.constraint(equalTo: centerYAnchor)
            ])
            sendSubviewToBack(rainGif)
        }
        
    }
    
}
