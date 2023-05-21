//
//  CharacterTableViewCell.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 19/05/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    static let identifier:String = "CharacterTableViewCell"
    
    var viewModel:CharacterCellViewModel?
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00)
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
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .white
            
        return label
        
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
        
    }()
    
    lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
        
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    public func setUpInfo(character: CharacterModel) {
        self.viewModel = CharacterCellViewModel(character: character)
        self.imagemView.image = viewModel?.getImage
        self.nameLabel.text = viewModel?.getName
        self.statusLabel.text = viewModel?.getSpecie
        self.speciesLabel.text = viewModel?.getStatus
    }
    
}

extension CharacterTableViewCell: ViewCode {
    func buildViewHierarchy() {
        self.contentView.addSubview(view)
        self.view.addSubview(imagemView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(statusLabel)
        self.view.addSubview(speciesLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.view.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 20),
            self.view.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -20),
            self.view.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -20),
            self.view.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 20),

            self.imagemView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            self.imagemView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.imagemView.heightAnchor.constraint(equalToConstant: 200),
            self.imagemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.imagemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //self.imagemView.widthAnchor.constraint(equalToConstant: 300),
            
            
            self.nameLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor, constant: 20),
            self.nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            self.statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            self.statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            self.speciesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
    
    func setupAditionalConfiguration() {
        self.contentView.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.14, alpha: 1.00)
        
    }
    
    
}



