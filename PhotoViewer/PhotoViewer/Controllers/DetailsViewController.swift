//
//  DetailsViewController.swift
//  PhotoViewer
//
//  Created by Slobodan Kovrlija on 5/27/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Properties
    var arrayOfPhotos = [Photo]()
    var indexOfSelected = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.layer.masksToBounds = true
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if arrayOfPhotos.count > 0 {
            let photo = arrayOfPhotos[indexOfSelected]
            setTitleAndImageWith(photo: photo)
        }
    }
    
    // MARK: - IBActions
    // Displays next image
    @IBAction func nextTapped(_ sender: Any) {
        indexOfSelected += 1
        if indexOfSelected < arrayOfPhotos.count {
            let photo = arrayOfPhotos[indexOfSelected]
            setTitleAndImageWith(photo: photo)
        } else {
            showAlertWith(message: "You've reached the last image.")
            indexOfSelected = arrayOfPhotos.count - 1
        }
    }
    
    // Displays previous image
    @IBAction func previousTapped(_ sender: Any) {
        indexOfSelected -= 1
        if indexOfSelected >= 0 {
            let photo = arrayOfPhotos[indexOfSelected]
            setTitleAndImageWith(photo: photo)
        } else {
            showAlertWith(message: "You've reached the first image.")
            indexOfSelected = 0
        }
        
    }
    
    // Sets id number, title and image
    func setTitleAndImageWith(photo: Photo) {
        if let id = photo.id {
            navigationItem.title = String(id)
        } else {
            navigationItem.title = ""
        }
        if let title = photo.title {
            UIView.transition(with: titleLabel,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                self.titleLabel.text = title.uppercased()
            },
                              completion: nil)
        } else {
            UIView.transition(with: titleLabel,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.titleLabel.text = "TITLE MISSING"
            },
                              completion: nil)
        }
        let urlString = photo.url
        if let url = URL(string: urlString) {
            UIView.transition(with: photoImageView,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.photoImageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder_panda"))
            },
                              completion: nil)
        }
    }
}
