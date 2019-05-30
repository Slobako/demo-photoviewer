//
//  PhotosTests.swift
//  PhotoViewerTests
//
//  Created by Slobodan Kovrlija on 5/29/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class PhotosTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Init_WhenGivenUrlSetsUrl() {
        let photo = Photo(url: "https://via.placeholder.com/600/771796")
        XCTAssertEqual(photo.url, "https://via.placeholder.com/600/771796", "should set photo url")
    }
    
    func test_Init_WhenGivenAlbumIdSetsAlbumId() {
        let photo = Photo(url: "", albumId: 1)
        XCTAssertEqual(photo.albumId, 1, "should set photo albumId")
    }
    
    func test_Init_WhenGivenIdSetsId() {
        let photo = Photo(url: "", id: 5)
        XCTAssertEqual(photo.id, 5, "should set photo id")
    }
    
    func test_Init_WhenGivenTitleSetsTitle() {
        let photo = Photo(url: "", title: "officia porro iure quia iusto qui ipsa ut modi")
        XCTAssertEqual(photo.title, "officia porro iure quia iusto qui ipsa ut modi", "should set photo title")
    }
    
    func test_Init_WhenGivenThumbnailUrlSetsThumbnailUrl() {
        let photo = Photo(url: "", thumbnailUrl: "https://via.placeholder.com/150/771796")
        XCTAssertEqual(photo.thumbnailUrl, "https://via.placeholder.com/150/771796", "should set photo thumbnailUrl")
    }
    
}
