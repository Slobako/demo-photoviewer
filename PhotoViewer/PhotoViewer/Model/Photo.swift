//
//  Thumbnail.swift
//  PhotoViewer
//
//  Created by Slobodan Kovrlija on 5/27/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String
    let thumbnailUrl: String?
    
    
    init(url: String, albumId: Int? = nil, id: Int? = nil, title: String? = nil, thumbnailUrl: String? = nil) {
        self.url = url
        self.albumId = albumId
        self.id = id
        self.title = title
        self.thumbnailUrl = thumbnailUrl
    }
}
