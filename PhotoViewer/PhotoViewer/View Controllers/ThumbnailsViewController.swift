//
//  ThumbnailsViewController.swift
//  PhotoViewer
//
//  Created by Slobodan Kovrlija on 2/28/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class ThumbnailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let thumbnailCellIdentifier = "ThumbnailCell"
    var arrayOfThumbnails = [Photo]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DownloadManager.shared.downloadPhotos { (arrayOfPhotos) in
            self.arrayOfThumbnails = arrayOfPhotos
            print("There are \(arrayOfPhotos.count) photo dicts.")
        }
        
        let thumbCellNib = UINib(nibName: "ThumbnailTableViewCell", bundle: nil)
        tableView.register(thumbCellNib, forCellReuseIdentifier: thumbnailCellIdentifier)
    }
    
}

extension ThumbnailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfThumbnails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        return UITableViewCell()
    }
    
    
    
}
