//
//  CharacterListViewModel.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 19/05/23.
//
import UIKit
import Foundation

protocol viewModelDelegate: NSObject {
     func reloadTableView()
}

class CharacterListViewModel {
    

    private var url = "https://rickandmortyapi.com/api/character"
    
    private var imagem: UIImage?
    
    private var next = ""
    
    private weak var delegate:viewModelDelegate?
    
    public var characterList: [Character] = []
    
    public func delegate(delegate:viewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchCharacters(pagination: Bool) {
        
        if pagination {
           url = next
        }
        
        ServiceManager().fetchCharacters(url: url) { success, error in
            if let success = success {
                self.appendCharacterList(recipes: success)
                self.next.append(success.info.next)
                
            } else {
                print("Falha na requisicão")
            }
        }
    }
    
    private func fetchImage(url: String, numb: Int)  {
        
         ServiceManager().fetchImage(url: url) { data in
        
            if let data = data {
                self.imagem = data
                self.updateList(numb: numb)
               
            } else {
                print("Falha na requisicão da imagem")
            }
            self.delegate?.reloadTableView()
        }
       
        
    }
    
    
    private func appendCharacterList(recipes: Recipes) {
        recipes.results.forEach { (item) in
            
            self.fetchImage(url: item.image, numb: item.id)
            let character = Character(id: item.id, name: item.name, status: item.status.rawValue, species: item.species.rawValue, type: item.type, gender: item.gender.rawValue, origin: item.origin.name, location: item.location.name, image: self.imagem, url: item.url, created: item.created)
                self.characterList.append(character)
            }
    
        
            
    }
    
    private func updateList(numb: Int) {
        let num  = numb-1
        characterList[num].image = self.imagem
    }
    
    
    public var numbOfRows:Int {
        return self.characterList.count
    }
    
    public func currentCharacter(indexPath: IndexPath) -> Character {
        return self.characterList[indexPath.row]
    }
}

