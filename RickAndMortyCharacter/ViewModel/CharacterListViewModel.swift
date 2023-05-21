//
//  CharacterListViewModel.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 19/05/23.
//
import UIKit

protocol viewModelDelegate: NSObject {
     func reloadTableView()
}
class CharacterListViewModel {
    

    private var url = "https://rickandmortyapi.com/api/character"
    
    private var characterList: [CharacterModel] = []
    
    private weak var delegate:viewModelDelegate?
    
    public func delegate(delegate:viewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchCharacters() {
        
        ServiceManager().fetchCharacters(url: url) { success, error in
            if let success = success {
                self.appendCharacterList(recipes: success)
                self.delegate?.reloadTableView()
            } else {
                print("Falha na requisicão")
            }
        }
    }
    
    
    private func appendCharacterList(recipes: Recipes) {
        recipes.results.forEach { (item) in
            characterList.append(item)
            print(item)
        }
    }
    
    public var numbOfRows:Int {
        return self.characterList.count
    }
    
    public func currentCharacter(indexPath: IndexPath) -> CharacterModel {
        return self.characterList[indexPath.row]
    }
}

