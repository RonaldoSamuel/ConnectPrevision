//
//  SeteDiasCell.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 29/03/21.
//

import UIKit
import MaterialComponents

class SeteDiasCell: UITableViewCell {
    
    static let identifier = "SelecionarMarcaCategoriaIRCell"
    
    var cardTable: UIView = {
        var card = UIView()
        card.isUserInteractionEnabled = false
        card.backgroundColor = .clear
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    var stackDentro: UIStackView = {
        var stk = UIStackView()
        stk.spacing = -30
        stk.axis = .horizontal
        stk.distribution = .fillProportionally	
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var diaSemana: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = .black
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var tempC: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var feelsLike: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var btnProximo: UIButton = {
        var btn = UIButton()
        btn.tintColor = .gray
        btn.contentMode = .scaleToFill
        btn.isEnabled = false
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var condiction: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .blue
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){
        
        contentView.backgroundColor = .clear
        
        setupCardView()
        setupStack()
    }
    
    func setupCardView(){
        contentView.addSubview(cardTable)
        NSLayoutConstraint.activate([
            cardTable.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cardTable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardTable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    func setupStack(){
        cardTable.addSubview(diaSemana)
        NSLayoutConstraint.activate([
            diaSemana.topAnchor.constraint(equalTo: cardTable.topAnchor),
            diaSemana.leadingAnchor.constraint(equalTo: cardTable.leadingAnchor,constant: 20),
            diaSemana.trailingAnchor.constraint(equalTo: diaSemana.leadingAnchor,constant: 40),
            diaSemana.bottomAnchor.constraint(equalTo: cardTable.bottomAnchor)
        ])
        
        cardTable.addSubview(tempC)
        NSLayoutConstraint.activate([
            tempC.topAnchor.constraint(equalTo: cardTable.topAnchor),
            tempC.leadingAnchor.constraint(equalTo: diaSemana.trailingAnchor,constant: 10),
            tempC.trailingAnchor.constraint(equalTo: tempC.leadingAnchor,constant: 50),
            tempC.bottomAnchor.constraint(equalTo: cardTable.bottomAnchor)
        ])
        
        cardTable.addSubview(feelsLike)
        NSLayoutConstraint.activate([
            feelsLike.topAnchor.constraint(equalTo: cardTable.topAnchor),
            feelsLike.leadingAnchor.constraint(equalTo: tempC.trailingAnchor,constant: 5),
            feelsLike.trailingAnchor.constraint(equalTo: feelsLike.leadingAnchor,constant: 50),
            feelsLike.bottomAnchor.constraint(equalTo: cardTable.bottomAnchor)
        ])
        
        cardTable.addSubview(btnProximo)
        NSLayoutConstraint.activate([
            btnProximo.topAnchor.constraint(equalTo: cardTable.topAnchor),
            btnProximo.leadingAnchor.constraint(equalTo: feelsLike.trailingAnchor,constant: 10),
            btnProximo.trailingAnchor.constraint(equalTo: btnProximo.leadingAnchor,constant: 40),
            btnProximo.bottomAnchor.constraint(equalTo: cardTable.bottomAnchor)
        ])
        
        cardTable.addSubview(condiction)
        NSLayoutConstraint.activate([
            condiction.topAnchor.constraint(equalTo: cardTable.topAnchor),
            condiction.leadingAnchor.constraint(equalTo: btnProximo.trailingAnchor,constant: 10),
            condiction.trailingAnchor.constraint(equalTo: cardTable.trailingAnchor,constant: -20),
            condiction.bottomAnchor.constraint(equalTo: cardTable.bottomAnchor)
        ])
    }
    
    func convertDateFormat(inputDate: String) -> String {
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let oldDate = (olDateFormatter.date(from: inputDate)) else { return "falso" }
        let convertDateFormatter = DateFormatter()
        
        let loc = Locale(identifier: "language".translate)
        convertDateFormatter.locale = loc
        convertDateFormatter.dateFormat = "EE"
        return convertDateFormatter.string(from: oldDate)
    }
    
    func configCell(_ item: Forecastday,index: Int){
        let icone = "\(item.day.condition.icon)"
        let iconCode = String(icone.suffix(7)).digits
        btnProximo.setImage(UIImage(named: iconCode), for: .normal)
        
        diaSemana.text = "\(convertDateFormat(inputDate: item.date))"
        condiction.text = "\(item.day.condition.text)"
        
        if "language".translate == "us"{
            tempC.text = "\(item.day.avgtempF)°f"
            feelsLike.text = "\(item.day.maxtempF)°f"
        }else{
            tempC.text = "\(item.day.avgtempC)°c"
            feelsLike.text = "\(item.day.maxtempC)°c"
        }
        
        tempC.textColor = UIColor(red: 0.24, green: 0.53, blue: 0.98, alpha: 0.80)
        condiction.textColor = UIColor(red: 0.24, green: 0.53, blue: 0.98, alpha: 1.00)
        feelsLike.textColor = .gray
        
        backgroundColor = .clear
    }
}
