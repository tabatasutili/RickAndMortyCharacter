//
//  Character.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 22/05/23.
//

import Foundation
import UIKit

struct Character {
    let id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: String
    var location: String
    var image: UIImage?
    var url: String
    var created: String
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: String, location: String, image: UIImage? = nil, url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.url = url
        self.created = created
    }
}

