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
                    self.thumbnailImageView?.sd_setImage(with: thumbnailUrl, placeholderImage: UIImage(named: "placeholder_panda"))
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImageView.layer.masksToBounds = true
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.cornerRadius = 5
        
        contentView.layer.borderWidth = 4
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
