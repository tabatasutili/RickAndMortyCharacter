//
//  CharacterCellViewModel.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 21/05/23.
//
import Foundation
import UIKit

class CharacterCellViewModel {
    private var character:Character
    private let service = ServiceManager()
    
    init(character:Character) {
        self.character = character
    }
    
    
    
    public var getImage:UIImage? {
        self.character.image
    }
    
    public var getName:String {
        return self.character.name
    }
    
    public var getStatus:String {
        return "Status: " + self.character.status
    }
    
    public var getSpecie:String {
        return "Specie: " + self.character.species
    }
}
