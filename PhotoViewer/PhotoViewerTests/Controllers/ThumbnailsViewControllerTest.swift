//
//  ThumbnailsViewControllerTest.swift
//  PhotoViewerTests
//
//  Created by Slobodan Kovrlija on 5/29/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class ThumbnailsViewControllerTest: XCTestCase {

    var sut: ThumbnailsViewController!
    var tableView: UITableView!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ThumbnailsVC")
        sut = (viewController as! ThumbnailsViewController)
        _ = sut.view
        
        tableView = UITableView()
        tableView.dataSource = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingViewSetsTableViewDataSource() {
        XCTAssertTrue(sut.tableView.dataSource is ThumbnailsViewController)
    }
    
    func test_LoadingViewSetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView.delegate is ThumbnailsViewController)
    }
    
    func test_LoadingViewSetsDataSourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? ThumbnailsViewController, sut.tableView.delegate as? ThumbnailsViewController)
    }
    
    func test_NumberOfRowsInFirstSectionIsArrayOfThumbnailsCount() {
        
        sut.arrayOfThumbnails.append(Photo(url: "https://via.placeholder.com/600/24f355"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.arrayOfThumbnails.append(Photo(url: "https://via.placeholder.com/600/d32776"))
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
}
