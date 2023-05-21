//
//  CharacterCellViewModel.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 21/05/23.
//
import Foundation
import UIKit

class CharacterCellViewModel {
    private var character:CharacterModel
    private let service = ServiceManager()
    private var imagem: UIImage?
    
    init(character:CharacterModel) {
        self.character = character
        self.fetchImage()
    }
    
    private func fetchImage() {
        
        service.fetchImage(url: self.character.image) { data in
            
            if let data = data {
                DispatchQueue.main.async {
                    self.imagem = data
                }
            } else {
                print("Falha na requisicão da imagem")
            }
        }
    }
    
    public var getImage:UIImage? {
        if let img = self.imagem {
            return img
        }
        return nil
    }
    
    public var getName:String {
        return self.character.name
    }
    
    public var getStatus:String {
        return "Status: " + self.character.status.rawValue
    }
    
    public var getSpecie:String {
        return "Specie: " + self.character.name
    }
}
