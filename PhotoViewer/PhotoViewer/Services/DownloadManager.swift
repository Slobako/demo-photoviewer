//
//  DownloadManager.swift
//  PhotoViewer
//
//  Created by Slobodan Kovrlija on 5/27/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import Foundation

class DownloadManager {
    
    // MARK: - Properties
    
    static let shared = DownloadManager()
    
    let photoUrlString = "https://jsonplaceholder.typicode.com/photos"

    
    // MARK: - Functions
    
    /// Retrieves images from jsonplaceholder typicode API
    ///
    /// - Parameters: none
    ///
    /// - Returns an array of image dictionaries of type 'Photo' in a completion block
    func downloadPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let url = URL(string: photoUrlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if response != nil {
                do {
                    guard let data = data
                        else {
                            print("Data returned is nil")
                            return
                    }
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode([Photo].self, from: data)
                    completion(responseObject)
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                print("Error - response returned nil")
            }
        }
        task.resume()
    }
}
