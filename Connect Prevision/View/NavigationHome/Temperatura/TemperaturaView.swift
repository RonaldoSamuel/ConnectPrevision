//
//  TemperaturaView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit

class TemperaturaView: UIView{
    
    var topView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "seven_days".translate
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
        tbl.isUserInteractionEnabled = false
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    var subDescricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Air Quality Index"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var valorAirLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "40"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var subValorAirLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Good"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topView.roundCorners([.topLeft, .topRight], radius: 50)
        
    }
    
    func createSubViews(){
        backgroundColor = .gray
        setupTopView()
        setupDescricaoLabel()
        setupTableView()
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
            contentTableView.heightAnchor.constraint(equalToConstant: size.height*0.6)
        ])
    }
    
}
