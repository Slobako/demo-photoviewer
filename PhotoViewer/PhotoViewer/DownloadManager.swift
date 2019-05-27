//
//  DownloadManager.swift
//  PhotoViewer
//
//  Created by Slobodan Kovrlija on 5/27/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import Foundation

class DownloadManager {
    
    static let shared = DownloadManager()
    let photoUrlString = "https://jsonplaceholder.typicode.com/photos"

    func downloadPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let url = URL(string: photoUrlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if response != nil {
                do {
                    guard let data = data else { return }
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode([Photo].self, from: data)
                    completion(responseObject)
                } catch let error {
                    print(error)
                }
            } else {
                print("Error")
            }
        }
        task.resume()
    }
}
