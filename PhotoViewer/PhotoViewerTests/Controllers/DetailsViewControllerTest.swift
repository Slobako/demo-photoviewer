//
//  DetailsViewControllerTest.swift
//  PhotoViewerTests
//
//  Created by Slobodan Kovrlija on 5/30/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class DetailsViewControllerTest: XCTestCase {

    var sut: DetailsViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsVC")
        sut = (viewController as! DetailsViewController)
        _ = sut.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_HasTitleLabel() {
        XCTAssertNotNil(sut.titleLabel)
    }
    
    func test_HasPhotoImageView() {
        XCTAssertNotNil(sut.photoImageView)
    }
    
    func test_HasNextButton() {
        XCTAssertNotNil(sut.nextButton)
    }
    
    func test_HasPreviousButton() {
        XCTAssertNotNil(sut.previousButton)
    }
    
    func test_SettingSelectedItemIndexSetsTitleLabelAndNavigationTitle() {
        let photo1 = Photo(url: "", id: 7, title: "qui eius qui autem sed")
        let photo2 = Photo(url: "", id: 8, title: "beatae et provident et ut vel")
        sut.arrayOfPhotos.append(contentsOf: [photo1, photo2])
        sut.indexOfSelected = 1
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        XCTAssertEqual(sut.titleLabel.text, ("beatae et provident et ut vel").uppercased())
        XCTAssertEqual(sut.navigationItem.title, "8")
    }
}
