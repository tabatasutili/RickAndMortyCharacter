//
//  CharacterDetailViewController.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 20/05/23.

import UIKit

class CharacterDetailViewController: UIViewController {
    
    let viewModel = CharacterListViewModel()
    let detailView = DetailsView(frame: UIScreen.main.bounds)
    var character:Character?

    override func viewDidLoad() {
        setupView()
        
    }
}

extension CharacterDetailViewController: ViewCode {
    func buildViewHierarchy() {
        self.view.addSubview(detailView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.detailView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        ])
        
    }
    
    func setupAditionalConfiguration() {
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)
        if let character = character {
            detailView.setUpInfo(character: character)
        }
        
        
    }
    
    
}
