//
//  TemperaturaView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit

class TemperaturaView: UIView{
    
    var descricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Next 7 Days"
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
    
    func createSubViews(){
        backgroundColor = .white
        setupDescricaoLabel()
        setupTableView()
    }
    
    func setupDescricaoLabel(){
        addSubview(descricaoLabel)
        NSLayoutConstraint.activate([
            descricaoLabel.topAnchor.constraint(equalTo: topAnchor,constant: size.height*0.25),
            descricaoLabel.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -size.width*0.25)
        ])
    }
    
    func setupTableView(){
        addSubview(contentTableView)
        NSLayoutConstraint.activate([
            contentTableView.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor,constant: 10),
            contentTableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            contentTableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -0),
            contentTableView.heightAnchor.constraint(equalToConstant: size.height*0.6)
        ])
    }
    
}
