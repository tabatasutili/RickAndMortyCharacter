//
//  DetailsView.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 22/05/23.
//

import Foundation
import UIKit

class DetailsView: UIView {
    
    var viewModel:CharacterDetailViewModel?
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor(red: 0.89, green: 0.86, blue: 0.81, alpha: 1.00)
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        return view
        
    }()
    
    lazy var imagemView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        view.backgroundColor = .white
        return view
        
    }()
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
            
        return label
        
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .italicSystemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var createdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)
        setupView()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    public func setUpInfo(character: Character) {
        viewModel = CharacterDetailViewModel(character: character)
        self.imagemView.image = viewModel?.getImage
        self.nameLabel.text = viewModel?.getName
        self.statusLabel.text = viewModel?.getStatus
        self.speciesLabel.text = viewModel?.getSpecies
        self.typeLabel.text = viewModel?.getType
        self.genderLabel.text = viewModel?.getGender
        self.originLabel.text = viewModel?.getOrigin
        self.locationLabel.text = viewModel?.getLocation
        self.createdLabel.text = viewModel?.getCreated
        
    }
    
}

extension DetailsView: ViewCode {
    func buildViewHierarchy() {
        self.addSubview(view)
        self.view.addSubview(imagemView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(statusLabel)
        self.view.addSubview(speciesLabel)
        self.view.addSubview(genderLabel)
        self.view.addSubview(originLabel)
        self.view.addSubview(locationLabel)
        self.view.addSubview(createdLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            self.imagemView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            self.imagemView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.imagemView.heightAnchor.constraint(equalToConstant: 250),
            self.imagemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.imagemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            self.nameLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor, constant: 20),
            self.nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            self.statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            self.statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            self.speciesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 10),
            self.genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.originLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            self.originLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.locationLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10),
            self.locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            self.createdLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            self.createdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
    
    func setupAditionalConfiguration() {
        self.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)
        
    }
    
    
}




