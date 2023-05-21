//
//  CharacterListViewController.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 19/05/23.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    let viewModel = CharacterListViewModel()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        setupView()
        self.viewModel.fetchCharacters()
        self.viewModel.delegate(delegate: self)
        
    }
}

extension CharacterListViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        ])
        
    }
    
    func setupAditionalConfiguration() {
        
        
    }
    
    
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numbOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell
        cell?.setUpInfo(character: self.viewModel.currentCharacter(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = self.viewModel.currentCharacter(indexPath: indexPath)
        print("Clicouuuuuu")
        let detailViewController = CharacterDetailViewController()
        self.navigationController?.present(detailViewController, animated: true)
        //self.navigationController?.pushViewController(detailViewController, animated: false)
        
    }

}



extension CharacterListViewController: viewModelDelegate {
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    
}
