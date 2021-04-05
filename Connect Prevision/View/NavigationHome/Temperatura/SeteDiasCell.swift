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
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var tempC: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var feelsLike: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 0
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
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 0
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
        cardTable.addSubview(stackDentro)
        NSLayoutConstraint.activate([
            stackDentro.topAnchor.constraint(equalTo: cardTable.topAnchor),
            stackDentro.leadingAnchor.constraint(equalTo: cardTable.leadingAnchor),
            stackDentro.trailingAnchor.constraint(equalTo: cardTable.trailingAnchor),
            stackDentro.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        stackDentro.addArrangedSubview(diaSemana)
        stackDentro.addArrangedSubview(tempC)
        stackDentro.addArrangedSubview(feelsLike)
        stackDentro.addArrangedSubview(btnProximo)
        NSLayoutConstraint.activate([
            btnProximo.widthAnchor.constraint(equalToConstant: 30),
            btnProximo.heightAnchor.constraint(equalToConstant: 30)
        ])
        stackDentro.addArrangedSubview(condiction)
        
    }
    
    func convertDateFormat(inputDate: String) -> String {
        print(inputDate)
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let oldDate = (olDateFormatter.date(from: inputDate)) else { return "falso" }
        let convertDateFormatter = DateFormatter()
        
        convertDateFormatter.dateFormat = "EE"
        return convertDateFormatter.string(from: oldDate)
    }
    
    
    func configCell(_ item: Forecastday,index: Int){
        let horario = item.date
        diaSemana.text = "\(convertDateFormat(inputDate: item.date))"
        
        tempC.text = "\(item.day.avgtempC)"
        tempC.textColor = UIColor(red: 0.24, green: 0.53, blue: 0.98, alpha: 0.80)
        
        feelsLike.text = "\(item.day.maxtempC)"
        feelsLike.textColor = .gray
        
        let icone = "\(item.day.condition.icon)"
        let iconCode = String(icone.suffix(7)).digits
        
        btnProximo.setImage(UIImage(named: iconCode), for: .normal)
        
        condiction.text = "\(item.day.condition.text)"
        condiction.textColor = UIColor(red: 0.24, green: 0.53, blue: 0.98, alpha: 1.00)
        backgroundColor = .clear
    }
}
