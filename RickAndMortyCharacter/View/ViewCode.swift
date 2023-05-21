//
//  ViewCode.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 20/05/23.
//

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
}
