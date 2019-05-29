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
    let thumbnailCellNibName = "ThumbnailTableViewCell"
    var arrayOfThumbnails = [Photo]()
    
    let refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPhotos()
        setTableView()
    }
    
    func fetchPhotos() {
        DownloadManager.shared.downloadPhotos { [unowned self] (arrayOfPhotos) in
            self.arrayOfThumbnails.removeAll()
            self.arrayOfThumbnails = arrayOfPhotos
            DispatchQueue.main.async {
                self.tableView.reloadData()
                if self.refreshControl.isRefreshing {
                    self.refreshControl.endRefreshing()
                }
            }
            print("There are \(arrayOfPhotos.count) photo dicts.")
        }
    }
    
    func setTableView() {
        let thumbCellNib = UINib(nibName: thumbnailCellNibName, bundle: nil)
        tableView.register(thumbCellNib, forCellReuseIdentifier: thumbnailCellIdentifier)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshFeed), for: .valueChanged)
    }
    
    @objc func refreshFeed() {
        fetchPhotos()
    }
}

// MARK: - TableView Data Source & Delegate
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
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        // Instantiate detail view controller for selected row/image
        guard let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsViewController else { return }
        let navigationController = UINavigationController(rootViewController: detailsVC)
        detailsVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissModal))
        
        detailsVC.arrayOfPhotos = arrayOfThumbnails
        detailsVC.indexOfSelected = indexPath.row
        
        present(navigationController, animated: true, completion: nil)
    }
 
    @objc func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}
