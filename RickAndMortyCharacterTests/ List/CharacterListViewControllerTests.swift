//
//  CharacterListViewControllerTests.swift
//  RickAndMortyCharacterTests
//
//  Created by Sabrina on 22/05/23.
//

import XCTest

import XCTest
@testable import RickAndMortyCharacter

class CharacterListViewControllerTests: XCTestCase {
    
    var viewController: CharacterListViewController!
    var indexPath:IndexPath!

    override func setUp() {
        super.setUp()
        indexPath = IndexPath(row: 0, section: 0)
        viewController = CharacterListViewController()
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testTableViewDelegateIsSet() {
        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertTrue(viewController.tableView.delegate is CharacterListViewController)
    }
    
    func testTableViewDataSourceIsSet() {
        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertTrue(viewController.tableView.dataSource is CharacterListViewController)
    }
    
    func testTableViewRegistersCell() {
        let identifier = "CharacterTableViewCell"
        let cell = viewController.tableView.dequeueReusableCell(withIdentifier: identifier)
        XCTAssertNotNil(cell)
    }
    
    func testTableViewNumberOfRows() {
        let numberOfRows = viewController.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, viewController.viewModel.numbOfRows)
    }
    
    func testTableViewCellHeightForRow() {
        let height = viewController.tableView(viewController.tableView, heightForRowAt: indexPath)
        XCTAssertEqual(height, 400)
    }
    
    
    func testReloadTableView() {
        viewController.reloadTableView()
        // Assert the expected behavior after reloading the table view
    }

}
