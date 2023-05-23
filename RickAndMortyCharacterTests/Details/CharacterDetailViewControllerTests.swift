//
//  CharacterDetailViewControllerTests.swift
//  RickAndMortyCharacterTests
//
//  Created by Sabrina on 22/05/23.
//

import XCTest
@testable import RickAndMortyCharacter

class CharacterDetailViewControllerTests: XCTestCase {

    var viewController: CharacterDetailViewController!

    override func setUp() {
        super.setUp()
        let character = Character(id: 1, name: "John Doe", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "City", image: UIImage(named: "portal"), url: "", created: "2021-01-01T12:34:56.789Z")
        viewController = CharacterDetailViewController()
        viewController.character = character
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }

    func testDetailViewIsAddedToHierarchy() {
        let detailView = viewController.view.subviews.first
        XCTAssertTrue(detailView is DetailsView)
    }

    func testDetailViewConstraints() {
        let detailView = viewController.view.subviews.first
        let topConstraint = detailView?.topAnchor.constraint(equalTo: viewController.view.topAnchor)
        let bottomConstraint = detailView?.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
        let leadingConstraint = detailView?.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor)
        let trailingConstraint = detailView?.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor)

        XCTAssertEqual(topConstraint?.relation, .equal)
        XCTAssertEqual(bottomConstraint?.relation, .equal)
        XCTAssertEqual(leadingConstraint?.relation, .equal)
        XCTAssertEqual(trailingConstraint?.relation, .equal)

        XCTAssertEqual(topConstraint?.constant, 0)
        XCTAssertEqual(bottomConstraint?.constant, 0)
        XCTAssertEqual(leadingConstraint?.constant, 0)
        XCTAssertEqual(trailingConstraint?.constant, 0)
    }

    func testBackgroundColor() {
        let expectedColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)
        XCTAssertEqual(viewController.view.backgroundColor, expectedColor)
    }

    func testSetUpInfo() {
        let character = Character(id: 1, name: "John Doe", status: "Alive", species: "Human", type: "", gender: "Male", origin: "Earth", location: "City", image: UIImage(named: "portal"), url: "", created: "2022-01-01")
        viewController.character = character
        viewController.setupAditionalConfiguration()

        // Add assertions to check if the character information is properly set in the detail view
        // Example: XCTAssertEqual(viewController.detailView.titleLabel.text, "John Doe")
        // Example: XCTAssertEqual(viewController.detailView.statusLabel.text, "Alive")
    }

}

