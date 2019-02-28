//
//  ThumbnailsViewController.swift
//  PhotoViewer
//
//  Created by Slobodan Kovrlija on 2/28/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class ThumbnailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var thumbnailCollectionView: UICollectionView!
    
    // MARK: - Properties
    let thumbnailCellIdentifier = "ThumbnailCell"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let thumbCellNib = UINib(nibName: "ThumbnailCollectionViewCell", bundle: nil)
        thumbnailCollectionView.register(thumbCellNib, forCellWithReuseIdentifier: thumbnailCellIdentifier)
    }
    
    // MARK: - CollectionView delegate and data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thumbnailCellIdentifier, for: indexPath) as? ThumbnailCollectionViewCell else { return UICollectionViewCell() }
        
        
        
        return cell
    }

}
