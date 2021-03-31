//
//  TemperaturaViewController.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 24/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class TemperaturaViewController: UIViewController{
    
    var presentationView = TemperaturaView()
    var coordinator: NavigationBarCoordinator?
    var viewModel = TelaHomeViewModel()
    var disposable: DisposeBag = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentationView.contentTableView.refreshControl?.addTarget(self, action: #selector(reloadItens(_:)), for: .valueChanged)
        bindView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func bindView(){
        viewModel.bindViewModel()
        viewModel.statusFeedback.bind { value in
            print(value)
            switch value{
            case .VALORES_CARREGADOS:
                self.presentationView.contentTableView.reloadData()
                break
            case .CARREGANDO:
                break
            case .FALHA:
                break
            case .DEFAULT:
                break
            }
            
        }.disposed(by: disposable)
        
        viewModel.breachesRX.bind(to: presentationView.contentTableView.rx.items(cellIdentifier: SeteDiasCell.identifier, cellType: SeteDiasCell.self)
        ) { index, item, cell in
            cell.configCell(item,index: index)
            cell.selectionStyle = .none
            cell.btnProximo.tag = index
        }.disposed(by: disposable)
    }
    
    @objc func reloadItens(_ sender: UIRefreshControl) {
        sender.endRefreshing()
        fetchBreachs()
    }
    
    func fetchBreachs(){
            self.presentationView.contentTableView.reloadData()
    }
    
}

extension TemperaturaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .gray
        tableView.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}
