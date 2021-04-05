//
//  TelaHomeCollectionCell.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 31/03/21.
//

import UIKit

class TelaHomeCollectionCell: UICollectionViewCell {
    
    static let identifier = "TelaHomeCollectionCell"
    
    var viewItem: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var verticalStack: UIStackView = {
        var stk = UIStackView()
        stk.spacing = 2
        stk.axis = .vertical
        stk.distribution = .fillEqually
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var horarioLabel: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .gray
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var imagemItem: UIImageView = {
        var img = UIImageView()
        img.tintColor = .white
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var labelDescricao: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .gray
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        setupViewItens()
    }
    
    func setupViewItens(){
        
        contentView.addSubview(viewItem)
        NSLayoutConstraint.activate([
            viewItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        viewItem.addSubview(verticalStack)
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: viewItem.topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: viewItem.bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: viewItem.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor)
        ])
        verticalStack.addArrangedSubview(horarioLabel)
        verticalStack.addArrangedSubview(imagemItem)
        NSLayoutConstraint.activate([
            imagemItem.widthAnchor.constraint(equalToConstant: 20),
            imagemItem.heightAnchor.constraint(equalToConstant: 20)
        ])
        verticalStack.addArrangedSubview(labelDescricao)
        
        
    }
    
    func convertDateFormat(inputDate: String) -> String {
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let oldDate = (olDateFormatter.date(from: inputDate)) else { return "falso" }
        let convertDateFormatter = DateFormatter()
        
        convertDateFormatter.dateFormat = "HH:mm"
        return convertDateFormatter.string(from: oldDate)
        convertDateFormatter.dateFormat = "HH"
    }
    
    func configCell(_ item: Hour){
        guard let horario = item.time, let temperatura = item.tempC else { return }
        
        
        horarioLabel.text = "\(convertDateFormat(inputDate: horario))"
        imagemItem.image = UIImage(named: "uivlight")?.withRenderingMode(.alwaysTemplate)
        imagemItem.tintColor = UIColor(red: 0.23, green: 0.51, blue: 0.78, alpha: 1.00)
        labelDescricao.text = "\(temperatura)°"
    }
}
