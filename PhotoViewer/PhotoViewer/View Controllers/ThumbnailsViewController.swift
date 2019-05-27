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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: thumbnailCellIdentifier, for: indexPath) as? ThumbnailTableViewCell else { return UITableViewCell() }
        
        cell.photo = arrayOfThumbnails[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsViewController else { return }
        let navigationController = UINavigationController(rootViewController: detailsVC)
        detailsVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissModal))
        detailsVC.navigationItem.title = "THUMBNAIL DETAILS"
        let selectedCell = tableView.cellForRow(at: indexPath) as! ThumbnailTableViewCell
        detailsVC.photo = selectedCell.photo
        
        present(navigationController, animated: true, completion: nil)
    }
 
    @objc func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}
