//
//  CharacterDetailViewModel.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 22/05/23.
//

import Foundation
import UIKit

class CharacterDetailViewModel {
    private var character:Character
    
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
    
    public var getSpecies:String {
        return "Specie: " + self.character.species
    }
    public var getType:String {
        return "Type: " + self.character.type
    }
    public var getGender:String {
        return "Gender: " + self.character.gender
    }
    public var getOrigin:String {
        return "Origin: " + self.character.origin
    }
    public var getLocation:String {
        return "Location: " + self.character.location
    }
    
    public var getCreated:String {
        let formattedDate = formatDate(dateString: self.character.created)
        return "Created: " + formattedDate
    }
    
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: dateString) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "dd/MM/yy"
            return newDateFormatter.string(from: date)
        }
        return "00/00/00"
    }

}
