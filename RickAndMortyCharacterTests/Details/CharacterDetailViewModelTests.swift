//
//  CharacterDetailViewModelTests.swift
//  RickAndMortyCharacterTests
//
//  Created by Sabrina on 22/05/23.
//

import XCTest

@testable import RickAndMortyCharacter

class CharacterDetailViewModelTests: XCTestCase {

    func testGetImage() {
        let image = UIImage(named: "portal")
        let character = Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "Earth", image: image, url: "", created: "2021-01-01T12:34:56.789Z")
        let viewModel = CharacterDetailViewModel(character: character)

        XCTAssertEqual(viewModel.getImage, image)
    }

    func testGetName() {
        let character = Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "Earth", image: UIImage(named: "portal"), url: "", created: "2021-01-01T12:34:56.789Z")
        let viewModel = CharacterDetailViewModel(character: character)

        XCTAssertEqual(viewModel.getName, "Rick")
    }

    func testGetStatus() {
        let character = Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "Earth", image: UIImage(named: "portal"), url: "", created: "2021-01-01T12:34:56.789Z")
        let viewModel = CharacterDetailViewModel(character: character)

        XCTAssertEqual(viewModel.getStatus, "Status: Alive")
    }

    func testGetSpecies() {
        let character = Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "Earth", image: UIImage(named: "portal"), url: "", created: "2021-01-01T12:34:56.789Z")
        let viewModel = CharacterDetailViewModel(character: character)

        XCTAssertEqual(viewModel.getSpecies, "Specie: Human")
    }
    
    func testFormatDate() {
            let viewModel = CharacterDetailViewModel(character: Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "Earth", image: UIImage(named: "portal"), url: "", created: "2021-01-01T12:34:56.789Z"))
            
            let formattedDate = viewModel.formatDate(dateString: "2021-01-01T12:34:56.789Z")
            
            XCTAssertEqual(formattedDate, "01/01/21")
        }


}
