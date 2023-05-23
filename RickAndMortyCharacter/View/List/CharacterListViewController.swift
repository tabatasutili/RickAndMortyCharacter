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
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)

        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        setupView()
        self.viewModel.fetchCharacters(pagination: false)
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
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)
        
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
        //CharacterDetailViewModel(character: character)
        let detailViewController = CharacterDetailViewController()
        detailViewController.character = character
        self.present(detailViewController, animated: true, completion: nil)
        
    }

}



extension CharacterListViewController: viewModelDelegate {
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    
}

extension CharacterListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height-800 {
            print("mais dataaaaa")
            self.viewModel.fetchCharacters(pagination: true)
        }
        
    }
    
    
}
