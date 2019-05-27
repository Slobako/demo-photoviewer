//
//  ThumbnailTableViewCell.swift
//  PhotoViewer
//
//  Created by Slobodan Kovrlija on 5/27/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit
import SDWebImage

class ThumbnailTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // MARK: - Properties
    var photo: Photo? {
        didSet {
            if let id = photo?.id {
                idLabel.text = String(id)
            }
            if let title = photo?.title {
                titleLabel.text = title
            }
            if let thumbnailUrlString = photo?.thumbnailUrl {
                if let thumbnailUrl = URL(string: thumbnailUrlString) {
                    DispatchQueue.main.async {
                        self.thumbnailImageView?.sd_setImage(with: thumbnailUrl, placeholderImage: UIImage(named: "placeholder_panda"))
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
