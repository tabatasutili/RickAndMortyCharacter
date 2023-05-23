//
//  CharacterListViewModelTests.swift
//  RickAndMortyCharacterTests
//
//  Created by Sabrina on 22/05/23.
//

import XCTest

@testable import RickAndMortyCharacter

class CharacterListViewModelTests: XCTestCase {

    var viewModel: CharacterListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CharacterListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    

    func testNumberOfRows() {
        viewModel.characterList = [Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "Earth", image: UIImage(named: "portal"), url: "", created: "2021-01-01"),
                                   Character(id: 2, name: "Morty", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "Earth", image: UIImage(named: "portal"), url: "", created: "2021-01-01"),
                                   Character(id: 3, name: "Summer", status: "Alive", species: "Human", type: "", gender: "Female", origin: "Earth", location: "Earth", image: UIImage(named: "portal"), url: "", created: "2021-01-01")]

        XCTAssertEqual(viewModel.numbOfRows, 3)
    }

    func testCurrentCharacter() {
        let character = Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "Earth", image: nil, url: "", created: "2021-01-01")
        viewModel.characterList = [character]

        let indexPath = IndexPath(row: 0, section: 0)
        let currentCharacter = viewModel.currentCharacter(indexPath: indexPath)

        XCTAssertEqual(currentCharacter.name, character.name)
    }

}

